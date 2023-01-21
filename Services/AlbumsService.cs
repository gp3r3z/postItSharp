namespace postItSharp.Services;

public class AlbumsService
{
    private readonly AlbumsRepository _repo;

    public AlbumsService(AlbumsRepository repo)
    {
        _repo = repo;
    }
    internal List<Album> Get(string userId)
    {
        List<Album> albums = _repo.Get();
        List<Album> filtered = albums.FindAll(a => a.Archived == false || a.CreatorId == userId);

        return filtered;
    }

    internal Album Create(Album albumData)
    {
        Album album = _repo.Create(albumData);
        return album; 
    }

}
