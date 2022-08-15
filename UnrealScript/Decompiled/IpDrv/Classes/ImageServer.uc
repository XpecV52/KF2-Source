/*******************************************************************************
 * ImageServer generated by Eliot.UELib using UE Explorer.
 * Eliot.UELib ? 2009-2022 Eliot van Uytfanghe. All rights reserved.
 * http://eliotvu.com
 *
 * All rights belong to their respective owners.
 *******************************************************************************/
class ImageServer extends WebApplication;

event Query(WebRequest Request, WebResponse Response)
{
    local string Image;

    Image = Request.URI;
    if(!Response.FileExists(Path $ Image))
    {
        Response.HTTPError(404);
        return;        
    }
    else
    {
        if((Right(Caps(Image), 4) == ".JPG") || Right(Caps(Image), 5) == ".JPEG")
        {
            Response.SendStandardHeaders("image/jpeg", true);            
        }
        else
        {
            if(Right(Caps(Image), 4) == ".GIF")
            {
                Response.SendStandardHeaders("image/gif", true);                
            }
            else
            {
                if(Right(Caps(Image), 4) == ".BMP")
                {
                    Response.SendStandardHeaders("image/bmp", true);                    
                }
                else
                {
                    if(Right(Caps(Image), 4) == ".PNG")
                    {
                        Response.SendStandardHeaders("image/png", true);                        
                    }
                    else
                    {
                        Response.SendStandardHeaders("application/octet-stream", true);
                    }
                }
            }
        }
    }
    Response.IncludeBinaryFile(Path $ Image);
}
