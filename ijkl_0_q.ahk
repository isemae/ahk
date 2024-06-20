;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; [ 간단 autoHokey 문법 정리 ]
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; 키 지정 방법: https://autohotkey.com/docs/Hotkeys.htm
; 전체 키 목록: https://autohotkey.com/docs/KeyList.htm
; #: Win
; !: Alt
; ^: Ctrl
; +: Shift
; &: 두개의 키 조합
; send는 한문자 일일이 타이핑하게 되고 (속도가 느리고)
; sendinput은 복사하여 붙여넣는 스피드로 (속도가 빠르다)
; { } 안에는 특정 키를 누르게 되며, { } 없는 것은 문자열로 인식하게 되어 타이핑된다.
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; - 기본 capslock기능을 꺼둠
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SetCapsLockState, AlwaysOff
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; - capslock + b 키로 기본 capslock를 키고 끔
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Capslock & b::Capslock
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; - Capslock키를 누르고 있을경우
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#If GetKeyState("Capslock","P")
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; - 방향키
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

w::Up
s::Down
a::Left
d::Right

q & w::PgUp
q & s::PgDn

e::Home
r::End

i::Up
k::Down
j::Left
l::Right

q & i::^Up
q & k::^Down
q & j::^Left
q & l::^Right

t::Home
y::End

Left::^Left
Right::^Right
Up::^Up
Down::^Down


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; - 커맨드
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Enter::^Enter
Space::^Enter
q & Space::Enter

p::Send, {=}
q & p::Send, {+}

g::SendInput, {Home}+{End}{BackSpace}

Tab::BackSpace	
q & Tab::Delete


o::^BackSpace
u::^Delete
q & o:: BackSpace
q & u::Delete

x::^x
c::^c
v::^v

F1::Media_Prev
F2::Media_Play_Pause
F3::Media_Next

;Space::
KeyWait,Space
if A_TimeSinceThisHotkey >= 300 ; in milliseconds.
SetCapsLockState, % (State:=!State) ? "On" : "Off"
else
Send, {vk15sc1F2}
return
; 한영전환


;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; - 넘버패드
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

f & n::SendInput, {0}
f & j::SendInput, {1}
f & k::SendInput, {2}
f & l::SendInput, {3}
f & u::SendInput, {4}
f & i::SendInput, {5}
f & o::SendInput, {6}

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; - 코딩 특수기호
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

m::Send, {-}
n::Send, {_}

f & /::Send, {=}{>} ; - 화살표함수
f & ,::Send, {<}{=} ; - 논리값
f & .::Send, {>}{=}
f & m::Send, {-}{>} ; - 인스턴스 참조

;'::Send, {``} ; - 백틱
;q & '::Send, {~}

;[::Send, {/}{*} ; - 주석
;]::Send, {*}{/}
;q & [::Send, {<}{!}{-}{-}
;q & ]::Send, {-}{-}{>}

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; - 자주 쓰는 문장 자동완성 단축키
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
`::SendInput, ""{Left}
1::SendInput, ''{Left}
2::SendInput, (){Left}
3::SendInput, {{}{}}{Left}
4::SendInput, []{Left}

`;:: SendInput, {End};^{Enter}
f & `;:: SendInput, console.log(){Left}
f & '::SendInput, ${{}{}}{Left}
,::SendInput, <>{Left}
.::SendInput, </>{Left}{Left}
;p::SendInput, {Home}print({End}){Home}

;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; - 한/영 단축키 변경
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; Alt::
; Send, {vk15sc138} ; shift + space를 한영키로 사용
; return


;출처: https://inpa.tistory.com/entry/💻-코딩용-키보드-⌨️-매크로-설정하기 [👨‍💻 Dev Scroll]