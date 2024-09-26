create table phone (
	phone_code int primary key,
    phone_name varchar(100),
    phone_price decimal(10, 2)		-- 데시말은 소숫점 (_,2)2번째자리까지
) engine=innodb;

-- decimal : sql 에서 숫자 값을 정밀하게 저장하기 위해서 사용한다.
-- 소숫점을 다룰 때 유용하다.
-- 1번째 인자 : 정밀도, 전체 숫자의 최대 자릿수를 의미 소숫점 앞뒤 포함
-- 2번째 인자 : 소숫점 아래 올 수 있는 죄대 자리수 의미

insert into phone
value
(1, '갤럭시S24울트라', 1200000),
(2, '갤럭시Z폴드6', 2250000),
(3, '갤럭시Z플립', 1400000);

describe phone;

select * from phone;

-- explain (설명)
-- 우리가 작성한 쿼리문의 실행 계획을 출력해준다.
explain select * from phone where phone_name = '갤럭시S24울트라';

-- 인덱스가 없는 컬럼을 where 절의 조건으로 실행한 결과

-- index 생성
create index idx_name
on phone(phone_name);

show index from phone;

select * from phone where phone_name = '갤럭시Z폴드6';
-- 실행 계획 출력을 통해 인덱스를 통해 데이터를 빠르게 조회했는 지 확임
explain select * from phone where phone_name = '갤럭시Z폴드6';		-- 읽어놨던 데이터라 바로 가져옴 -> 인덱스다

drop index idx_name on phone;

show index from phone;		-- 인덱스는 많은 조회가 필요할 때 주로 쓰임 / 빈번한 사용