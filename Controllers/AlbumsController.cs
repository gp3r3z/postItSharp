namespace postItSharp.Controllers;

[ApiController]
[Route("api/[controller]")]
public class AlbumsController : ControllerBase
{
    private readonly AlbumsService _albumsService;
    private readonly Auth0Provider _auth0provider;

    public AlbumsController(AlbumsService albumsService, Auth0Provider auth0provider)
    {
        _albumsService = albumsService;
        _auth0provider = auth0provider;
    }


    [HttpGet]
    public async Task<ActionResult<List<Album>>> Get()
    {
        try
        {
            Account userInfo = await _auth0provider.GetUserInfoAsync<Account>(HttpContext);
            List<Album> albums = _albumsService.Get(userInfo?.Id);
            return Ok(albums);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpPost]
    [Authorize]
    public async Task<ActionResult<Album>> Create([FromBody] Album albumData)
    {
        try
        {
            Account userInfo = await _auth0provider.GetUserInfoAsync<Account>(HttpContext);

            albumData.CreatorId = userInfo.Id;

            Album album = _albumsService.Create(albumData);
            album.Creator = userInfo;
            return Ok(album);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }
}