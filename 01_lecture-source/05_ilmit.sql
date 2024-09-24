-- limit
-- 영문 번역 그대로 제한(한계) 하는 것에 사용이 된다.
-- 예를 들어 select 조회 결과에 반환할 행 갯수 제한

select
	*
from
	tbl_menu;

select
	*
from
	tbl_menu
order by
	menu_price desc
limit
	-- 반환 받을 행의 수 입력
	5;

-- where -> orderby -> limit

-- 위에 작성한 식은 반환 받을 행의 수

-- [] <- 내부에 작성하는 것은 생략이 가능하다
-- limit[offset, ] row_count
-- offset : 시작 할 행의 번호(인덱스 체계)
-- now_count : 이후 행 부터 반환 받을 행의 갯수

select
	menu_code,
    menu_name,
    menu_price
from
	tbl_menu
order by
	menu_price desc

-- 2번째 행부터 5번째 행까지만 결과를 보고싶다.
limit
	1, 4;
        