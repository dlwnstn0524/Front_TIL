-- 1. 이름과 연봉을 ‘KING : 1 Year Salary = 60000’형식으로 출력
select concat(ENAME, " : 1 year Salary = ", SAL*12) as info
from emp;
-- 2. 가장 최근에 입사한 순서로 사원번호, 이름, 급여, 입사일을 출력
select EMPNO, ENAME, SAL, HIREDATE
FROM emp
ORDER BY HIREDATE DESC;
-- 3. 업무가 PRESIDENT 이거나 급여가 2000 이상이고 부서가 20인 사원의 이름,업무,급여를 출력
SELECT ENAME, JOB, SAL
FROM emp
WHERE JOB = "PRESIDENT" OR (SAL >= 2000 AND DEPTNO = 20);
-- 4. 이름이 S로 시작하고 T를 포함하는 사원의 모든 정보를 출력
SELECT *
FROM emp
WHERE ENAME LIKE "S%T%";
-- 5. 이름에 AR이 포함되어있는 사원의 사원번호와 이름을 검색
SELECT EMPNO, ENAME
FROM emp
WHERE ENAME LIKE "%AR%";
-- 6. 이름의 두번째 위치에 A이 있는 사원정보 출력
SELECT *
FROM emp
WHERE ENAME LIKE "_A%";

-- 1. 현재까지의 근무일수가 몇 주 몇 일인가 출력하라 ,근무일수가 많은 사람순서로 출력하라. (예: 근무일수가 총 30일이면 4주 2일로 출력)
-- SELECT DATEDIFF(CURRENT_DATE(), HIREDATE)
-- FROM emp;
SELECT CONCAT(FLOOR(DATEDIFF(CURRENT_DATE(), HIREDATE) / 7), '주', DATEDIFF(CURRENT_DATE(), HIREDATE) % 7, '일')AS DAYS
FROM emp
ORDER BY DAYS;

-- 2. 현재까지의 근무 월수를 계산하여 출력하라
-- SELECT dayofmonth(HIREDATE)
SELECT TIMESTAMPDIFF(MONTH , HIREDATE, CURRENT_DATE())
FROM emp;

-- 3. 입사일자로부터 돌아오는 금요일을 출력하라
SELECT DATE_ADD(hiredate, INTERVAL (6 - DAYOFWEEK(hiredate) + 7) % 7 DAY) AS "금요일"
FROM emp;
-- 4. 입사한 달의 근무일수를 계산하여 출력하라, 단 토/일요일도 근무일수에 포함한다.
SELECT TIMESTAMPDIFF(DAY, HIREDATE, LAST_DAY(HIREDATE))
FROM emp;
-- 5. 입사날짜를 ‘1 Jan 1981’ 과 ‘1981년 01월 01일’의 형태로 출력하라.
SELECT date_format(HIREDATE, "%e %M %Y"), date_format(HIREDATE, "%Y년 %m월 %d일")
FROM emp;
-- 6. 현재 급여를 기준으로 입사한 달의 근무일수에 해당하는 급여를 산출하라.
SELECT TIMESTAMPDIFF(DAY, HIREDATE, DATE_ADD(LAST_DAY(HIREDATE), INTERVAL 1 DAY))/DAY(LAST_DAY(HIREDATE))*SAL AS "입사한달 급여"
FROM emp;

-- 7. 사원번호, 이름, 급여, 상사코드를 입력하고 상사코드가 NULL 이면 NO MGR을 출력하라.
SELECT EMPNO, ENAME, SAL, IFNULL(MGR,"NO MGR")
FROM emp;

-- 8. JOB이 ANALYST 이면 수당으로 급여의 10%를 지급하고 CLERK 이면 급여의 15% 지급, MANAGER이면 20% 지급하려고 한다. 다른 업무는 보너스가 없다. 사원번호,이름,업무,급여,수당을 출력하라. (CASE문)
SELECT EMPNO, ENAME, JOB, SAL,
	CASE WHEN JOB = "ANALYST" THEN SAL*0.1
		 WHEN JOB = "CLERK" THEN SAL*0.15
		 WHEN JOB = "MANAGER" THEN SAL*0.2
         ELSE 0
	END "BONUS"
FROM emp;

-- 9. 급여가 2000 이상이면 보너스로 1000을 지급하고 3000 이상이면 1500을 지급하고 그 외에는 800을 지급하라
SELECT CASE
			WHEN SAL BETWEEN 2000 AND 2999 THEN 1000
			WHEN SAL >= 3000 THEN 1500
            ELSE 800
		END BONUS
FROM emp;

-- 1. EMP테이블에서 모든 SALESMAN에 대하여 급여의 평균, 최고액, 최저액, 합계를 구하여 출력하라.
SELECT AVG(SAL), MAX(SAL), MIN(SAL), SUM(SAL)
FROM emp
WHERE JOB = "SALESMAN";

-- 2. EMP 테이블에 등록되어 있는 인원수, 보너스에 NULL이 아닌 인원수, 전체 사원의 보너스 평균, 등록되어 있는 부서의 수를 구하여 출력하라.
SELECT COUNT(*), COUNT(COMM), AVG(COMM), COUNT(distinct DEPTNO)
FROM emp;

-- 3. 전체 급여가 5000을 초과하는 각 업무에 대해 업무와 급여 합계를 출력하라. 단, SALESMAN은 제외하고 급여 합계를 내림차순으로 정렬하라.
SELECT JOB, SUM(SAL)
FROM emp
GROUP BY JOB
	HAVING SUM(SAL) > 5000 AND JOB != "SALESMAN"
ORDER BY SUM(SAL) DESC;

-- 5. 부서별 업무별 급여의 평균을 출력하는 SELECT문장을 작성하라. (세자리 구분기호,정수에서 반올림)
SELECT JOB,
	FORMAT(ROUND(AVG(IF(DEPTNO = 10, SAL, NULL))) , 0) "DEPTNO 10",
    FORMAT(ROUND(AVG(IF(DEPTNO = 20, SAL, NULL))) , 0) "DEPTNO 20",
    FORMAT(ROUND(AVG(IF(DEPTNO = 30, SAL, NULL))) , 0) "DEPTNO 30",
    FORMAT(ROUND(AVG(SAL)), 0) TOTAL
FROM emp
GROUP BY JOB
ORDER BY JOB;
