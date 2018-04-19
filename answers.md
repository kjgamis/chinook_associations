## Part 3
### Questions
Make use of the methods added to your models by the associations in order to answer the following questions. The Rails guide on associations can remind you what those methods are.

1. Find the album titled "Vinicius De Moraes", and then use an association-provided method to find all its tracks.
```
Album.find_by(title: 'Vinicius De Moraes').tracks
```
2. Find the artist called "Philip Glass Ensemble", and then use an association-provided method to find all their albums.
```
Artist.find_by(name: 'Philip Glass Ensemble').albums
```
3. Find the "Brazilian Music" playlist and then use an association-provided method to find all its tracks.
```
Playlist.find_by(name: 'Brazilian Music').tracks
```
4. Find the "Jazz" genre and then use an association-provided method to find all its tracks.
```
Genre.find_by(name: 'Jazz').tracks
```
5. Find the track "My Time After Awhile" and then use an association-provided method to find its genre.
```
Track.find_by(name: 'My Time After Awhile').genre
```
6. Use an association-provided method to find the media type of that same track.
```
Track.find_by(name: 'My Time After Awhile').media_type
```
7. Use an association-provided method to find the album that track appears on.
```
Track.find_by(name: 'My Time After Awhile').album
```

## Part 4
1. Add a through association to Chinook that will allow you to make the following query: `ruby Artist.last.tracks` Test it out in the Rails console to make sure it worked.
```
class Artist < ApplicationRecord
  has_many :albums

  has_many :tracks, through: :albums
end
```
2. Add a through association to Chinook that will allow you to make the following query: `ruby Playlist.last.genres` Test it out in the Rails console to make sure it worked.
```
class Playlist < ApplicationRecord
  has_and_belongs_to_many :tracks

  has_many :genres, through: :tracks
end
```
3. Add a through association to Chinook that will allow you to make the following query: `ruby Album.last.playlists` Test it out in the Rails console to make sure it worked.
```
class Album < ApplicationRecord
  belongs_to :artist
  has_many :tracks

  has_many :playlists, through: :tracks
end
```
4. Add a through association to Chinook that will allow you to make the following query: `ruby Playlist.last.media_types` Test it out in the Rails console to make sure it worked.
```
class Playlist < ApplicationRecord
  has_and_belongs_to_many :tracks

  has_many :genres, through: :tracks

  has_many :media_types, through: :tracks
end
```
5. Add a through association to Chinook that will allow you to make the following query: `ruby Artist.last.media_types` Test it out in the Rails console to make sure it worked.
```
class Artist < ApplicationRecord
  has_many :albums

  has_many :tracks, through: :albums

  has_many :media_types, through: :tracks
end
```
6. Add a through association to Chinook that will allow you to make the following query: `ruby MediaType.last.genres` Test it out in the Rails console to make sure it worked.
```
class MediaType < ApplicationRecord
  has_many :tracks

  has_many :genres, through: :tracks
end
```
