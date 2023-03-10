
--Домашняя работа №3. Задание №2. select 

select album_name
from albums 
where album_year = '2018'

select track_name 
from tracks 
order by track_duration desc 
limit 1

select track_name
from tracks 
where track_duration > 3.5

select collection_name
from collections c 
where collection_year between 2018 and 2020

select nickname
from singers  
where array_length(regexp_split_to_array(nickname, '\s+'), 1) = 1;
--array_lenght - функция для работы с массивом, возвращает длину массиваб integer
--regexp_split_to_array - разделила строку в nickname на элементы массива, 
--используя пробел 


select track_name
from tracks
where track_name Like '%my%';


--Домашняя работа №4.

select count(gs.id_singer) as "Кол-во исполнителей", genre_name "в жанре"
from genres_singers gs 
join genres g on gs.id_genre = g.id_genre 
group by gs.id_singer, genre_name; 


select count(track_name) from tracks t
join albums a on a.id_album = t.id_album
where album_year between '2019' and '2021';


select round((avg(track_duration)), 2) from tracks;


select count(id_singer) from album_singers als
join albums a on a.id_album = als.id_album
where album_year <> '2020';


select collection_name from collections c
join track_collections tc on tc.id_collection = c.id_collection
join tracks t on t.id_track = tc.id_track
join album_singers alsi on alsi.id_album = t.id_album
join singers s on s.id_singer = alsi.id_singer
where nickname like '%Smoki%';


select album_name from albums a2
join album_singers as2 on as2.id_album = a2.id_album
right join (select count(gs.id_singer), gs.id_singer from genres_singers gs 
            join singers s on s.id_singer = gs.id_singer  
            group by gs.id_singer, gs.id_singer 
            having count(gs.id_singer) > 1) sel on sel.id_singer = as2.id_singer
            
            
select track_name from tracks t
left join track_collections tc on tc.id_track = t.id_track
where tc.id_collection is null


select nickname from singers s
join album_singers as3 on as3.id_singer = s.id_singer 
join tracks tr on tr.id_album = as3.id_album
where tr.track_duration = (select min(track_duration) from tracks)


--ЗАТРУДНЯЮСЬ С ЭТОЙ ЗАДАЧЕЙ. ВОПРОС: КАК УКАЗАТЬ УСЛОВИЕ ДЛЯ ВЫБОРКИ,
--ЧТО АГРЕГАТНАЯ ФУНКЦИЯ COUNT ДОЛЖНА БЫТЬ РАВНА СВОЕМУ МИНИМАЛЬНОМУ ЗНАЧЕНИЮ?
--У МЕНЯ ВЫШЕЛ ТОЛЬКО ТАКОЙ ГРОМОЗДСКИЙ КОД
select count(tr.id_album) as "tracks_in_the_album", tr.id_album, al2.album_name 
from tracks tr
join albums al2 on al2.id_album = tr.id_album
group by tr.id_album, al2.album_name
having  count(tr.id_album) = (
select min(tracks_in_the_album) 
from 
    (select count(tr.id_album) as "tracks_in_the_album", tr.id_album, al2.album_name 
     from tracks tr
     join albums al2 on al2.id_album = tr.id_album
     group by tr.id_album, al2.album_name) foo)

          
           


            
