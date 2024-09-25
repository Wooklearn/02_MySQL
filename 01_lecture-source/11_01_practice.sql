use employee;

-- 직급이 대리이면서 아시아 지역에 근무하는 직원 조회
-- 사번, 이름, 직급명, 부서명, 근무지역명, 급여를 조회하세요
-- (조회시에는 모든 컬럼에 테이블 별칭을 사용하는 것이 좋다.)
-- (사용 테이블 : job, department, location, employee)
select
	a.EMP_ID, 		-- 사원번호   / employee
    a.EMP_NAME,		-- 이름      / employee
    c.JOB_NAME,		-- 직급명    / job
    b.DEPT_TITLE,	-- 부서명    / department
    LOCAL_NAME,	-- 근무지역명 / location
    a.SALARY		-- 급여명    / employee
from
	employee a
join department b on a.DEPT_CODE = b.DEPT_ID
join job c on a.JOb_CODE = c.JOb_CODE
join location d on b.LOCATION_ID = d.LOCAL_CODE

where
	c.JOB_NAME = '대리' and d.LOCAL_NAME like 'ASIA%';
    
-- 2. 주민번호가 70년대 생이면서 성별이 여자이고, 
--    성이 전씨인 직원들의 사원명, 주민번호, 부서명, 직급명을 조회하시오.
-- (사용 테이블 : employee, department, job)
select
	a.EMP_NAME,		-- 사원명   	/  employee
    a.EMP_NO,		-- 주민번호	/  employee
    b.DEPT_TITLE,	-- 부서명		/  department
    c.JOB_NAME		-- 직급명		/  job
from
	employee a
join
	department b on a.DEPT_CODE = b.DEPT_ID
join
	job c on a.JOB_CODE = c.JOB_CODE
where
	a.EMP_NO like '7______2%' and a.EMP_NAME like '전%';

-- 3. 이름에 '형'자가 들어가는 직원들의
-- 사번, 사원명, 직급명을 조회하시오.
-- (사용 테이블 : employee, job)
select
	a.EMP_ID,    -- 사번  /  employee
    a.EMP_NAME,  -- 사원명 /  employee
    b.JOB_NAME   -- 직급명 /  job
from
	employee a
join
	job b on (a.JOB_CODE = b.JOB_CODE)
where
	a.EMP_NAME like '%형%';
    
-- 4. 해외영업팀에 근무하는 사원명, 
--    직급명, 부서코드, 부서명을 조회하시오.
-- (사용 테이블 : employee, department, job)
select
	b.EMP_NAME,	  -- 사원명 	/ employee
	a.JOB_NAME,   -- 직급명   /  job
	b.DEPT_CODE,  -- 부서코드 /  employee
    c.DEPT_TITLE  -- 부서명  /  department
from
	job a
join
	employee b on a.JOB_CODE = b.JOB_CODE
join
	department c on b.DEPT_CODE = c.DEPT_ID
where
	c.DEPT_TITLE like '해외영업%';
	
-- 5. 보너스포인트를 받는 직원들의 사원명, 
--    보너스포인트, 부서명, 근무지역명을 조회하시오.
-- (사용 테이블 : employee, department, location)
select
	a.EMP_NAME,	-- 사원명   / employee
    a.BONUS,		-- 보너스   / employee
    b.DEPT_TITLE  -- 부서명   / department
    LOCAL_NAME  -- 근무지역명/ location
from
	employee a
join
	department b on a.DEPT_CODE = b.DEPT_ID
join
	location c on c.LOCAL_CODE = b.LOCATION_ID
where
	a.BONUS is not null;	-- 왜 is not null; 일까?

-- 6. 부서코드가 D2인 직원들의 사원명, 
--    직급명, 부서명, 근무지역명을 조회하시오.
-- (사용 테이블 : employee, job, department, location)

-- 7. 본인 급여 등급의 최소급여(MIN_SAL)를 초과하여 급여를 받는 직원들의
--    사원명, 직급명, 급여, 보너스포함 연봉을 조회하시오.
--    연봉에 보너스포인트를 적용하시오.
-- (사용 테이블 : employee, job, sal_grade)

-- 8. 한국(KO)과 일본(JP)에 근무하는 직원들의 
--    사원명, 부서명, 지역명, 국가명을 조회하시오.