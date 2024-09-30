use chundb;

-- 1. 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록 한다.
select
	student_name,
    student_address
from
	TB_STUDENT
order by
	student_name;
    
-- 2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오.
select
	student_name,
    student_ssn 
from
	TB_STUDENT
where
	ABSENCE_YN like 'Y'
order by
	str_to_date (substring(student_ssn,1 ,6), '%y%m%d') desc;
	
-- 3. 주소지가 강원도나 경기도인 학생들 중 2020년대 학번을 가진 학생들의 이름과 학번, 
-- 주소를 이름의 오름차순으로 화면에 출력하시오. 단, 출력헤더에는 "학생이름","학번", "거주지 주소" 가 출력되도록 한다.
select
	student_name,
    student_no,
    student_address
from
	tb_student
where
	(student_address like '경기%'or 
	student_address like '강원%')and
    entrance_date like '202_%'
order by
	student_name;
	
-- 4. 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오. 
-- (법학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아 내도록 하자)
select
	professor_name,
    professor_ssn
from
	tb_professor
where
	DEPARTMENT_NO = (
					select
						DEPARTMENT_NO
					from
						tb_department
					where
						DEPARTMENT_NAME = '법학과')
order by
	professor_ssn;
    
-- 5. 2022 년 2학기에 C3118100 과목을 수강한 학생들의 학점을 조회하려고 한다. 
-- 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성해보시오.
select
	a.point,
    b.student_name
from
	tb_grade a
join
    tb_student b
where
	class_no like 'C3118100';
	
    
	
	



select * from TB_DEPARTMENT; --  학과테이블
select * from TB_STUDENT; -- 학생테이블
select * from TB_PROFESSOR; -- 교수테이블
select * from TB_CLASS; -- 수업테이블
select * from TB_CLASS_PROFESSOR; -- 수업교수테이블
select * from TB_GRADE; -- 학점테이블