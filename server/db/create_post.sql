TRUNCATE table Post restart identity cascade;

INSERT INTO Post (title, section_id, views, creation_date, thumbnail, content)
    values
    ('개발글1', 1, 0, now(), '/workspace/app/image/thumbnail/thumbnail1.png', '#뻘글1'),
    ('개발글2', 1, 0, now(), '/workspace/app/image/thumbnail/thumbnail2.png', '#뻘글2'),
    ('개발글3', 1, 0, now(), '/workspace/app/image/thumbnail/thumbnail3.png', '#뻘글3'),
    ('음악글1', 2, 0, now(), '/workspace/app/image/thumbnail/thumbnail4.png', '#뻘글4'),
    ('음악글2', 2, 0, now(), '/workspace/app/image/thumbnail/thumbnail5.png', '#뻘글5'),
    ('음악글3', 2, 0, now(), '/workspace/app/image/thumbnail/thumbnail6.png', '#뻘글6'),
    ('그림글1', 3, 0, now(), '/workspace/app/image/thumbnail/thumbnail7.png', '#뻘글7'),
    ('그림글2', 3, 0, now(), '/workspace/app/image/thumbnail/thumbnail8.png', '#뻘글8'),
    ('그림글3', 3, 0, now(), '/workspace/app/image/thumbnail/thumbnail9.png', '#뻘글9');

INSERT INTO Tags_in_post (post_id, tag_id)
    values (1, 1),
    (2, 2),
    (3, 1),
    (3, 2),
    (4, 3),
    (5, 4),
    (6, 3),
    (6, 4),
    (7, 5),
    (8, 6),
    (9, 5),
    (9, 6);

SELECT * FROM POST;
SELECT * FROM Tags_in_post;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id 
    INNER JOIN (SELECT id FROM Section WHERE name='개발') as S
    ON P.section_id = S.id;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names 
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id  
    INNER JOIN (SELECT id FROM Section WHERE name='음악') as S
    ON P.section_id = S.id;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names 
    FROM POST as P 
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id 
    INNER JOIN (SELECT id FROM Section WHERE name='그림') as S
    ON P.section_id = S.id;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY(array['Cpp'])) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id
    INNER JOIN (SELECT id FROM Section WHERE name = '개발') as S
    ON P.section_id = S.id;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY(array['Kotlin'])) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id
    INNER JOIN (SELECT id FROM Section WHERE name = '개발') as S
    ON P.section_id = S.id;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY(array['Cpp', 'Kotlin'])) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id
    INNER JOIN (SELECT id FROM Section WHERE name = '개발') as S
    ON P.section_id = S.id;



SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY(array['드럼'])) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id
    INNER JOIN (SELECT id FROM Section WHERE name = '음악') as S
    ON P.section_id = S.id;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY(array['작곡'])) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id
    INNER JOIN (SELECT id FROM Section WHERE name = '음악') as S
    ON P.section_id = S.id;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY(array['드럼', '작곡'])) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id
    INNER JOIN (SELECT id FROM Section WHERE name = '음악') as S
    ON P.section_id = S.id;


SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY(array['만화'])) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id
    INNER JOIN (SELECT id FROM Section WHERE name = '그림') as S
    ON P.section_id = S.id;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY(array['크로키'])) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id
    INNER JOIN (SELECT id FROM Section WHERE name = '그림') as S
    ON P.section_id = S.id;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY(array['만화', '크로키'])) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id
    INNER JOIN (SELECT id FROM Section WHERE name = '그림') as S
    ON P.section_id = S.id;

SELECT P.title, P.views, P.creation_date, P.thumbnail, TIP.tag_names
    FROM POST as P
    INNER JOIN (
        SELECT distinct inner_tip.post_id, array_agg (t.name) as tag_names
        FROM Tags_in_post as inner_tip
        INNER JOIN (SELECT id, name FROM Tag WHERE name = ANY(array['만화', '크로키'])) as t
        ON inner_tip.tag_id = t.id
        GROUP BY inner_tip.post_id
    ) as TIP
    ON P.id = TIP.post_id
    INNER JOIN (SELECT id FROM Section WHERE name = '그림') as S
    ON P.section_id = S.id
    WHERE P.title like '%2%';