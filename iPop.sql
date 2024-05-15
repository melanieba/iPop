-- Question 1, Creating the Tables
create table User(
Username varchar(20) primary key,
FirstName varchar(20) not null,
LastName varchar(20) not null,
DisplayName varchar(20),
Password varchar(20) not null
);
create table Playlist(
PlaylistID char(15) primary key,
PlaylistName char(25) not null,
Username varchar(20),
foreign key (Username) references User (Username) on update cascade
);
create table Album(
AlbumID char(5) primary key,
AlbumName varchar(25) not null,
ReleaseDate date,
AlbumArtLink varchar(200)
);
create table Song(
SongID char(7) primary key,
SongName varchar(30) not null,
AlbumID char(5),
Length smallint not null,
Genre varchar(22),
ReleaseDate date,
Link varchar(200) not null,
Streams bigint default 0,
foreign key (AlbumID) references Album (AlbumID) on update cascade
);
create table Artist(
ArtistID char(6) primary key,
ArtistName varchar(18) not null,
Birthday date,
Nationality varchar(20),
PhotoLink varchar(200)
);
create table Playlist_Song(
PlaylistID char(15),
SongID char(7),
primary key (PlaylistID, SongID),
foreign key (PlaylistID) references Playlist (PlaylistID) on update cascade,
foreign key (SongID) references Song (SongID) on update cascade
);
create table Artist_Song(
ArtistID char(6),
SongID char(7),
primary key (ArtistID, SongID),
foreign key (ArtistID) references Artist (ArtistID) on update cascade,
foreign key (SongID) references Song (SongID) on update cascade
);
create table Artist_Album(
ArtistID char(6),
AlbumID char(5),
primary key (ArtistID, AlbumID),
foreign key (ArtistID) references Artist (ArtistID) on update cascade,
foreign key (AlbumID) references Album (AlbumID) on update cascade
);
-- Question 2, Populating the Tables
-- Populating the User table
insert into User values
('elissalr', 'Elissa', 'Ryan', 'elissa', 'lilyryan'),
('ane.moni', 'Imani', 'Cage', 'iimanii', 'imani@123'),
('melaniebaloban', 'Melanie', 'Baloban', 'mels', 'CatLover123'),
('shamithaiscool', 'Shamitha', 'Pichika', 'shamithap', 'qwerty'),
('EDela', 'Ervin', 'Delacruz', 'Ervin D.', 'ErvinElephant'),
('Tami11', 'Tami', 'Logan', 'Tamiii', 'TamiTurtle11'),
('StacEspa', 'Staci', 'Esparza', 'Staci', 'StaciSeal55'),
('AlexMusic', 'Alexandria', 'Vasquez', 'Alexa', 'AlexAlpaca9'),
('CliffClimb', 'Clifton', 'Berg', 'Clif B', 'ClifCat7'),
('Malcom22', 'Malcolm', 'Dawson', 'Mal', 'MalcolmMonkey53');
-- Populating the Artist table
insert into Artist values
('000001', 'Doja Cat', '1995-10-21', 'American', 'https://images.squarespace-
cdn.com/content/v1/520ed800e4b0229123208764/1625363370811-K6AOMZHX6KGT3T1GA14Q/
_112482696_doja-cat-1392x1044.jpeg?format=2500w' ),
('000002', 'Lovejoy', NULL, 'British',
'https://i0.wp.com/micdropmusic.com/wp-content/uploads/2023/06/Lovejoy.webp?
fit=1200%2C801&ssl=1'),
('000003', 'Melanie Martinez', '1995-04-28', 'American',
'https://lh3.googleusercontent.com/ME9v1XfysRX_JO_YN1cO9fYhaVM9gYhwXz_PhLvIYsqytVrL
tOCqdDUaYzbhpXZcfMamYXdyVXLGZSk=w2880-h1200-p-l90-rj'),
('000004', 'Rufus Wainwright', '1973-07-22', 'American Canadian',
'https://www.udiscovermusic.com/wp-content/uploads/2023/04/rufus-wainwright-
3000DPI300RGB1000023472.jpg'),
('000005', 'Odetari', '2000-01-01', 'Palestinian American',
'https://i.pinimg.com/736x/2b/db/89/2bdb89a4dfb3edaefd6ddff562674b15.jpg'),
('000006', '6arelyhuman', '2001-07-16', 'American',
'https://viberatecdn.blob.core.windows.net/entity/artist/6arelyhuman-H9rwb'),
('000007', 'Hayd', '2001-05-25', 'American', 'https://ysolife.com/wp-content/
uploads/2022/09/1-1.png'),
('000008', 'Chance Pena', '2000-02-18', 'American', 'https://fault-
magazine.com/wp-content/uploads/2023/09/Chance-Pena-3-530x800.jpg'),
('000009', 'Train', NULL, 'American',
'https://www.billboard.com/wp-content/uploads/2022/02/Train-photo-credit-Brooke-
Clark-2022-billboard-1548.jpg?w=1024'),
('000010', 'Noah Kahan', '1997-01-01', 'American', 'https://static01.nyt.com/
images/2023/12/03/multimedia/01NOAH-KAHAN-01-fplw/01NOAH-KAHAN-01-fplw-
articleLarge.jpg?quality=75&auto=webp&disable=upscale'),
('000011', 'Maneskin', NULL, 'Italian',
'https://i.scdn.co/image/ab6761610000e5eb46d0db8a86fda630ec12401f'),
('000012', '21 Savage', '1992-10-22', 'British American', 'https://image-
cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2022%2F01%2F21-savage-teases-new-
music-in-tweet-001.jpg?cbr=1&q=90'),
('000013', 'Olivia Rodrigo', '2003-02-20', 'Filipino American',
'https://media.gq.com/photos/610172681ac2ac787b459b47/master/pass/olivia-rodrigo-
gq-september-2021-01.jpg'),
('000014', 'Nirvana', NULL, 'American', 'https://www.billboard.com/wp-
content/uploads/media/02-Nirvana-umg-billboard-press-1548-a.jpg?
w=942&h=623&crop=1'),
('000015', 'Ariana Grande', '1993-06-26', 'American',
'https://www.billboard.com/wp-content/uploads/media/Ariana-Grande-5-bb27-2018-feat-
billboard-airgbghejr-1240.jpg?w=1024') ,
('000016', 'Taylor Swift', '1989-12-13', 'American',
'https://ew.com/thmb/U4KoUetG2_4DlwtbcWr8jAIZPJc=/1500x0/filters:no_upscale():max_b
ytes(150000):strip_icc()/Taylor-Swift-031623-
b9ee99b19a504333a1ca0e3450233f6c.jpg'),
('000017', 'Clairo', '1998-08-18', 'American',
'https://static.wikia.nocookie.net/youtube/images/3/37/Clairoappearance.png/
revision/latest?cb=20221011235948');
-- Populating the Album table

update Album set AlbumArtLink = 'https://static.wikia.nocookie.net/lovejoy/images/2/22/Pebble_Brain.jpg/revision/latest?cb=20211013023101'
where AlbumID = '00002';

insert into Album values
('00001', 'Scarlet', '2023-09-22',
'https://media.pitchfork.com/photos/64f1ea3162097041dd8c6405/master/
w_1280%2Cc_limit/Doja-Cat-Scarlet.jpg'),
('00002', 'Pebble Brain', '2021-10-14',
'https://static.wikia.nocookie.net/lovejoy/images/2/22/Pebble_Brain.jpg/revision/latest?cb=20211013023101'),
('00003', 'PORTALS', '2023-03-31',
'https://m.media-amazon.com/images/I/81fmr6cplSL._UF1000,1000_QL80_.jpg'),
('00004', 'Meet the Robinsons', '2007-03-07',
'https://i.scdn.co/image/ab67616d0000b27368f6877f71128e695d8b3a18'),
('00005', 'Lovers to Strangers', '2023-07-14',
'https://i.scdn.co/image/ab67616d0000b273bc957e3ba31cd32ab13a86b0'),
('00006', 'Drops of Jupiter', '2001-03-27',
'https://upload.wikimedia.org/wikipedia/en/9/9d/Train_Drops_of_Jupiter.jpg'),
('00007', 'Stick Season', '2022-10-14',
'https://upload.wikimedia.org/wikipedia/en/1/13/Noah_Kahan_-_Stick_Season.png'),
('00008', 'RUSH! (ARE U COMING?)', '2023-11-10', 'https://m.media-amazon.com/
images/I/81ZglDU2ePL._UF1000,1000_QL80_.jpg'),
('00009', 'Midnights', '2022-10-21',
'https://media.newyorker.com/photos/6353080576c31adb3224668e/master/pass/Jackson-
Swift-Midnights.jpg'),
('00010', 'Dangerous Woman', '2016-05-20',
'https://images.genius.com/4386a69c79866ca73402830b393efbf8.1000x1000x1.jpg');
-- Populating the Song table
insert into Song values 
('0000001', 'Agora Hills', '00001', 264, 'Hip-Hop', '2023-09-21',
'https://www.youtube.com/watch?v=YHH4giJHWB8', 0),
('0000002', 'Perfume', '00002', 207, 'Indie Rock', '2021-10-14',
'https://www.youtube.com/watch?v=reVOktF-1ZM', 0),
('0000003', 'PLUTO', '00003', 181, 'Alternative/Indie', '2023-04-05',
'https://www.youtube.com/watch?v=YBy_2-sHjdw', 0),
('0000004', 'Another Believer', '00004', 279, 'Pop', '2007-03-27',
'https://www.youtube.com/watch?v=WwcEH24Ommw', 0),
('0000005', 'Pretty Girl', NULL, 178, 'Pop', '2017-08-04',
'https://www.youtube.com/watch?v=5Ss0PmNJsGE', 0),
('0000006', 'GMFU', NULL, 127, 'Pop', '2023-07-26', 'https://www.youtube.com/
watch?v=it1CatEknr8', 0),
('0000007', 'All of the Stars', NULL, 205, 'Alternative/Indie', '2024-02-14',
'https://www.youtube.com/watch?v=CbtoiMKaKGY', 0),
('0000008', 'Lovers to Strangers', '00005', 174, 'Alternative/Indie', '2023-07-14', 'https://www.youtube.com/watch?v=1FG-AebTAwY', 0),
('0000009', 'In My Room', '00005', 177, 'Alternative/Indie', '2023-07-14',
'https://www.youtube.com/watch?v=Wma8yX5W8yU', 0),
('0000010', 'Drops of Jupiter (Tell Me)', '00006', 256, 'Rock', '2001-03-27',
'https://www.youtube.com/watch?v=7Xf-Lesrkuc', 0),
('0000011', 'Northern Attitude', '00007', 267, 'Alternative/Indie', '2022-10-14', 'https://www.youtube.com/watch?v=_C5jzm6Y3wE', 0),
('0000012', 'VALENTINE', '00008', 216, 'Alternative/Rock', '2023-11-10',
'https://www.youtube.com/watch?v=8XQYz7JKjWI', 0),
('0000013', 'THE LONELIEST', '00008', 287, 'Rock', '2013-11-10',
'https://www.youtube.com/watch?v=odWKEfp2QMY', 0),
('0000014', 'Karma', '00009', 204, 'Pop', '2022-10-21',
'https://www.youtube.com/watch?v=pzVYSfzNQ5Y', 0),
('0000015', 'Into You', '00010', 254, 'Pop', '2016-05-20',
'https://www.youtube.com/watch?v=1ekZEVeXwek', 0);

SET SQL_SAFE_UPDATES = 0;
update Song set streams=1000 where SongID = 5;

-- Populating the Playlist table
insert into Playlist values
('000000000000001', 'Alternative & Indie', 'elissalr'),
('000000000000002', 'Alternative & Rock', 'elissalr'),
('000000000000003', 'Nostalgia vibes', 'ane.moni'),
('000000000000004', 'Funky Alt', 'ane.moni'),
('000000000000005', 'Morning Playlist', 'melaniebaloban'),
('000000000000006', 'Current Favs', 'melaniebaloban'),
('000000000000007', 'When I Am Sad', 'shamithaiscool'),
('000000000000008', 'When I Am Happy', 'shamithaiscool'),
('000000000000009', 'My Favs', 'EDela'),
('000000000000010', 'Playlist1', 'Tami11');
-- Populating the Playlist_Song table
insert into Playlist_Song values
('000000000000003', '0000004'),
('000000000000003', '0000010'),
('000000000000004', '0000006'),
('000000000000004', '0000002'),
('000000000000004', '0000003'),
('000000000000001', '0000007'),
('000000000000001', '0000008'),
('000000000000001', '0000009'),
('000000000000001', '0000011'),
('000000000000002', '0000010'),
('000000000000006', '0000012'),
('000000000000006', '0000013'),
('000000000000006', '0000001'),
('000000000000005', '0000014'),
('000000000000005', '0000015'),
('000000000000007', '0000014'),
('000000000000007', '0000008'),
('000000000000007', '0000005'),
('000000000000007', '0000012'),
('000000000000008', '0000015'),
('000000000000008', '0000013'),
('000000000000008', '0000002'),
('000000000000008', '0000003');
-- Populating the Artist_Song table
insert into Artist_Song values
('000001', '0000001'),
('000002', '0000002'),
('000003', '0000003'),
('000004', '0000004'),
('000005', '0000006'),
('000006', '0000006'),
('000017', '0000005'),
('000007', '0000007'),
('000008', '0000008'),
('000008', '0000009'),
('000009', '0000010'),
('000010', '0000011'),
('000011', '0000012'),
('000011', '0000013'),
('000015', '0000015'),
('000016', '0000014');
-- Populating the Artist_Album table
insert into Artist_Album values
('000001', '00001'),
('000002', '00002'),
('000003', '00003'),
('000004', '00004'),
('000008', '00005'),
('000009', '00006'),
('000010', '00007'),
('000011', '00008'),
('000015', '00010'),
('000016', '00009');



        

