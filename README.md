# Scheme 으로 구현한 Set

## contains? x s
> x값이 s 내에 있는지 확인하는 함수
> x는 체크하려는 값, s는 set
> 재귀적으로 set 내에 값이 있는지 확인  

s가 null인 경우에는 False를 반환  
s에서 car을 통해 첫 값부터 끝 값까지 확인하고  
contains? x (cdr s)를 통해 재귀적으로 contains?를 호출하여 확인

## is-empty s
> set이 비어있는지 확인하는 함수
> s는 set
> null? 함수를 이용해 확인

null? 함수를 이용해 비어있는 리스트임을 체크해 확인

## singleton-set x
> x 값만을 가지는 singleton set 생성하는 함수
> x 는 set의 값
> cons 함수를 이용해 생성

cons함수로 x와 '()를 이용해 set을 생성

## intersection s1 s2
> set1과 set2의 교집합을 구하는 함수
> s1, s2는 set
> cond를 통해 각 조건에 맞게 set을 생성

교집합을 구하는 함수이므로 s1과 s2에 중복으로 있는 값을 찾는다.
  
car, cdr을 사용하기 위해 s2의 값이 null인지 확인하고 null이면 '()을 반환한다. (재귀의 종료조건)

null이 아닌 경우에 s2에서 car한 값이 s1에 있는지 확인하여 있을 경우에만 더해야 한다. 이 때 car 한 값과 cdr한 값의 intersection을 cons로 더해 두 set 모두에 포함된 값만을 가지고 있는 set을 만들 수 있게 한다.

## union s1 s2
> set1과 set2의 합집합을 구하는 함수
> s1, s2는 set
> cond를 통해 각 조건에 맞게 set을 생성

합집합을 구하는 함수이므로 s1에 없는 s2만을 추가로 더해 set을 반환한다.

car, cdr을 사용하기 위해 s2의 값이 null인지 확인하고 null인 경우 s1을 반환한다. (재귀의 종료조건)

null이 아닌 경우에 s2에서 car한 값을 확인해 s1에 포함되지 않은 경우에 다음 cdr의 union값과 cons로 더한다.

## filter s p
> set 에 p 함수를 통과하는 값만을 남기는 함수
> s는 set, p 는 predicate(function) 
> cond를 통해 조건에 맞는 값들만 남김

cond를 통해 p를 s의 car 값에 적용했을 때 참일 경우에만 다음 filter 결과에 더해 filter를 통과한 값들만 남김

