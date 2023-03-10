
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



