/**
 * This class is responsible for tracking custom property item draw and input proxies.  It allows specifying a custom
 * draw or input proxy for a particular property, or for a particular property type.  This class is a singleton; to access
 * the values stored in this class, use UCustomPropertyItemBindings::StaticClass()->GetDefaultObject<UCustomPropertyItemBinding>();
 *
 * Copyright 1998-2013 Epic Games, Inc. All Rights Reserved.
 */
class CustomPropertyItemBindings extends Object
	native(Private)
	config(Editor);


/**
 * This struct is used for specifying custom draw or input proxies for a specific property.
 */
struct native PropertyItemCustomProxy
{
	/**
	 * The complete pathname for the property that this custom proxy should be applied to.  When the property window
	 * encounters a property with this path name, it will use the PropertyItemClassName to represent that property instead
	 * of the default property item class.
	 */
	var()		config			string							PropertyPathName;

	/**
	 * The complete path name for the class to use in the property item window for the associated property.
	 */
	var()		config			string							PropertyItemClassName;

	/**
	 * Only relevant when the property associated with this custom property item proxy is an array property.  Indicates that this
	 * this custom property item proxy should be used when creating the item which corresponds to the array header item, rather than the
	 * normal array header item.
	 */
	var()		config			bool							bReplaceArrayHeaders;

	/**
	 * Only relevant when the property associated with this custom property item proxy control is an array property.  Indicates that this
	 * custom property item proxy should not be used for individual array elements.
	 */
	var()		config			bool							bIgnoreArrayElements;

	/**
	 * The custom property item class specified by PropertyItemClassName.  This value is filled in the first time this
	 * PropertyItemCustomProxy's custom property item class is requested.
	 */
	var	transient				class							PropertyItemClass;
};

/**
 * This struct is used for specifying custom draw or input proxies for a specific property type.
 */
struct native PropertyTypeCustomProxy
{
	/**
	 * The name of the property that this custom proxy applies to (e.g. ObjectProperty, ComponentProperty, etc.).
	 */
	var()		config			name							PropertyName;

	/**
	 * The complete path name for the object class that this custom proxy should be used for (e.g. Engine.UITexture)
	 */
	var()		config			string							PropertyObjectClassPathName;

	/**
	 * The complete path name for the class to use in the property item window for the associated property.
	 */
	var()		config			string							PropertyItemClassName;

	/**
	 * Only relevant when the property associated with this custom property item proxy is an array property.  Indicates that this
	 * this custom property item proxy should be used when creating the item which corresponds to the array header item, rather than the
	 * normal array header item.
	 */
	var()		config			bool							bReplaceArrayHeaders;

	/**
	 * Only relevant when the property associated with this custom property item proxy control is an array property.  Indicates that this
	 * custom property item proxy should not be used for individual array elements.
	 */
	var()		config			bool							bIgnoreArrayElements;

	/**
	 * The custom property item class specified by PropertyItemClassName.  This value is filled in the first time this
	 * PropertyTypeCustomProxy's custom property item class is requested.
	 */
	var	transient				class							PropertyItemClass;
};

/**
 * This struct is used for specifying custom property window item classes for a specific property or unrealscript struct.
 */
struct native PropertyItemCustomClass
{
	/**
	 * The complete pathname for the property/script-struct that this property binding should be applied to.  When the property window
	 * encounters a property that has this path name, it will use the PropertyItemClassName to represent that property instead
	 * of the default property item class.
	 *
	 * If PropertyPathName corresponds to a script struct, the custom property item class will be used for all struct properties for that struct.
	 */
	var()		config			string							PropertyPathName;

	/**
	 * The name of the WxItemPropertyControl subclass to use in the property item window for the associated property.
	 */
	var()		config			string							PropertyItemClassName;

	/**
	 * Only relevant when the property associated with this custom property editing control is an array property.  Indicates that this
	 * this custom property item control should be used when creating the item which corresponds to the array header item, rather than the
	 * normal array header item.
	 */
	var()		config			bool							bReplaceArrayHeaders;

	/**
	 * Only relevant when the property associated with this custom property editing control is an array property.  Indicates that this
	 * custom property item control should not be used for individual array elements.
	 */
	var()		config			bool							bIgnoreArrayElements;

	/**
	 * A pointer to the WxItemPropertyControl class corresponding to PropertyItemClassName.  This value is filled the first
	 * time this PropertyItemCustomClass's custom property item class is requested.
	 */
	var	transient	native		pointer							WxPropertyItemClass{class wxClassInfo};
};

/**
 * This struct is used for specifying custom property window item classes for a specific property type.
 */
struct native PropertyTypeCustomClass
{
	/**
	 * The name of the property that this custom item class applies to (e.g. ObjectProperty, ComponentProperty, etc.).
	 */
	var()		config			name							PropertyName;

	/**
	 * The complete path name for the object class that this custom item class should be used for (e.g. Engine.UITexture)
	 */
	var()		config			string							PropertyObjectClassPathName;

	/**
	 * The name of the WxItemPropertyControl subclass to use in the property item window for the associated property.
	 */
	var()		config			string							PropertyItemClassName;

	/**
	 * Only relevant when the property associated with this custom property editing control is an array property.  Indicates that this
	 * this custom property item control should be used when creating the item which corresponds to the array header item, rather than the
	 * normal array header item.
	 */
	var()		config			bool							bReplaceArrayHeaders;

	/**
	 * Only relevant when the property associated with this custom property editing control is an array property.  Indicates that this
	 * custom property item control should not be used for individual array elements.
	 */
	var()		config			bool							bIgnoreArrayElements;

	/**
	 * A pointer to the WxItemPropertyControl class corresponding to PropertyItemClassName.  This value is filled the first
	 * time this PropertyTypeCustomClass's custom property item class is requested.
	 */
	var	transient	native		pointer							WxPropertyItemClass{class wxClassInfo};
};

/** custom property item classes, for specific properties */
var()			config			array<PropertyItemCustomClass>			CustomPropertyClasses;
/** custom property item classes, per property type */
var()			config			array<PropertyTypeCustomClass>			CustomPropertyTypeClasses;

/** custom draw proxy classes, for specific properties */
var()			config			array<PropertyItemCustomProxy>			CustomPropertyDrawProxies;
/** custom draw proxy classes, per property type */
var()			config			array<PropertyItemCustomProxy>			CustomPropertyInputProxies;

/** custom input proxy classes, for specific properties */
var()			config			array<PropertyTypeCustomProxy>			CustomPropertyTypeDrawProxies;
/** custom input proxy classes, per property type */
var()			config			array<PropertyTypeCustomProxy>			CustomPropertyTypeInputProxies;

// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)
// (cpptext)

cpptext
{
	/**
	 * Returns the custom draw proxy class that should be used for the property associated with
	 * the WxPropertyControl specified.
	 *
	 * @param	ProxyOwnerItem	the property window item that will be using this draw proxy
	 * @param	ArrayIndex		specifies which element of an array property that this property window will represent.  Only valid
	 *							when creating property window items for individual elements of an array.
	 *
	 * @return	a pointer to a child of UPropertyDrawProxy that should be used as the draw proxy
	 *			for the specified property, or NULL if there is no custom draw proxy configured for
	 *			the property.
	 */
	class UClass* GetCustomDrawProxy( const class WxPropertyControl* ProxyOwnerItem, INT ArrayIndex=INDEX_NONE );

	/**
	 * Returns the custom input proxy class that should be used for the property associated with
	 * the WxPropertyControl specified.
	 *
	 * @param	ProxyOwnerItem	the property window item that will be using this input proxy
	 * @param	ArrayIndex		specifies which element of an array property that this property window will represent.  Only valid
	 *							when creating property window items for individual elements of an array.
	 *
	 * @return	a pointer to a child of UPropertyInputProxy that should be used as the input proxy
	 *			for the specified property, or NULL if there is no custom input proxy configured for
	 *			the property.
	 */
	class UClass* GetCustomInputProxy( const class WxPropertyControl* ProxyOwnerItem, INT ArrayIndex=INDEX_NONE );

	/**
	 * Returns an instance of a custom property item class that should be used for the property specified.
	 *
	 * @param	InProperty	the property that will use the custom property item
	 * @param	ArrayIndex	specifies which element of an array property that this property window will represent.  Only valid
	 *						when creating property window items for individual elements of an array.
	 * @param	ParentItem	specified the property window item that will contain this new property window item.  Only
	 *						valid when creating property window items for individual array elements or struct member properties
	 *
	 * @return	a pointer to a child of WxItemPropertyControl that should be used as the property
	 *			item for the specified property, or NULL if there is no custom property item configured
	 * 			for the property.
	 */
	class WxItemPropertyControl* GetCustomPropertyWindow( class UProperty* InProperty, INT ArrayIndex=INDEX_NONE);

}


defaultproperties
{
   CustomPropertyClasses(0)=(PropertyPathName="UnrealEd.MaterialEditorInstanceConstant:LightmassSettings",PropertyItemClassName="WxPropertyWindow_LightmassMaterialParameters",bReplaceArrayHeaders=True)
   CustomPropertyClasses(1)=(PropertyPathName="UnrealEd.MaterialEditorInstanceTimeVarying:LightmassSettings",PropertyItemClassName="WxPropertyWindow_LightmassMaterialParameters",bReplaceArrayHeaders=True)
   CustomPropertyClasses(2)=(PropertyPathName="UnrealEd.UnrealEdTypes:LightmassScalarParameterValue.ParameterValue",PropertyItemClassName="WxCustomPropertyItem_LightmassMaterialParameter")
   CustomPropertyClasses(3)=(PropertyPathName="UnrealEd.MaterialEditorInstanceConstant:ParameterGroups",PropertyItemClassName="WxCustomPropertyItem_ParameterGroup",bReplaceArrayHeaders=True)
   CustomPropertyClasses(4)=(PropertyPathName="UnrealEd.MaterialEditorInstanceConstant:MobileParameterGroups",PropertyItemClassName="WxCustomPropertyItem_ParameterGroup",bReplaceArrayHeaders=True)
   CustomPropertyClasses(5)=(PropertyPathName="UnrealEd.DEditorVectorParameterValue:ParameterValue",PropertyItemClassName="WxCustomPropertyItem_MIC_Parameter",bReplaceArrayHeaders=True)
   CustomPropertyClasses(6)=(PropertyPathName="UnrealEd.DEditorStaticSwitchParameterValue:ParameterValue",PropertyItemClassName="WxCustomPropertyItem_MIC_Parameter",bReplaceArrayHeaders=True)
   CustomPropertyClasses(7)=(PropertyPathName="UnrealEd.DEditorStaticComponentMaskParameterValue:ParameterValue",PropertyItemClassName="WxCustomPropertyItem_MIC_Parameter",bReplaceArrayHeaders=True)
   CustomPropertyClasses(8)=(PropertyPathName="UnrealEd.DEditorScalarParameterValue:ParameterValue",PropertyItemClassName="WxCustomPropertyItem_MIC_Parameter",bReplaceArrayHeaders=True)
   CustomPropertyClasses(9)=(PropertyPathName="UnrealEd.DEditorTextureParameterValue:ParameterValue",PropertyItemClassName="WxCustomPropertyItem_MIC_Parameter",bReplaceArrayHeaders=True)
   CustomPropertyClasses(10)=(PropertyPathName="Engine.WorldInfo:LightmassSettings",PropertyItemClassName="WxCustomPropertyItem_LightmassWorldInfoSettingsParameter")
   CustomPropertyInputProxies(0)=(PropertyPathName="Engine.MaterialExpressionParameter:Group",PropertyItemClassName="UnrealEd.PropertyInput_DynamicCombo",bReplaceArrayHeaders=True)
   CustomPropertyInputProxies(1)=(PropertyPathName="Engine.MaterialExpressionTextureSampleParameter:Group",PropertyItemClassName="UnrealEd.PropertyInput_DynamicCombo",bReplaceArrayHeaders=True)
   CustomPropertyInputProxies(2)=(PropertyPathName="Engine.MaterialExpressionFontSampleParameter:Group",PropertyItemClassName="UnrealEd.PropertyInput_DynamicCombo",bReplaceArrayHeaders=True)
   Name="Default__CustomPropertyItemBindings"
   ObjectArchetype=Object'Core.Default__Object'
}
