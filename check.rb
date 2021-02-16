# 사전 준비물
# 파이어폭스
# 게코드라이버 - geckodriver
# 루비 - ruby

# 셀레니움을 쓸 수 있게 설정합니다. 브라우저와 코드 사이에서 커뮤니케이션을 해주는 라이브러리입니다.
require "selenium-webdriver"

# 파이어폭스를 셀레니움과 연결해줍니다. 파이어폭스가 다른 브라우저에 비해 오토메이션 속도가 빠른편입니다.
driver = Selenium::WebDriver.for :firefox

# 네이버 로그인 창 주소입니다. 로그인 후, cafe.naver... 이후의 주소로 이동됩니다.
uri = 'https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com'

# 브라우저가 위의 주소로 이동합니다.
driver.navigate.to uri

# 로그인에 필요한 아이디입니다.
id = 'abc'

# 아이디 입력칸에 아이디를 입력합니다.
driver.find_element(id: 'id').send_keys(id)

# 로그인에 필요한 비밀번호입니다. 이 스크립트를 공유할 때 비밀번호도 같이 공유될 수 있으니 주의하세요.
password = 'abc'

# 비밀번호 입력칸에 비밀번호를 입력합니다.
driver.find_element(id: 'pw').send_keys(password)

# 초록색 [로그인] 버튼을 클릭합니다.
driver.find_elements(class: 'btn_global')[0].click

# 출석체크 페이지 주소입니다. 
uri = 'https://m.cafe.naver.com/MemoCommentView.nhn?search.clubid=26337375&search.menuid=129&search.articleid=12100'

# 브라우저가 위의 주소로 이동합니다. 11번 줄의 코드와 동일합니다.
driver.navigate.to uri

# 브라우저가 출석체크 페이지로 이동하는 5초간 기다려줍니다. Zzz...
sleep(5)

# 네이버 카페의 출석체크 페이지는 껍데기 프레임과 콘텐츠 프레임으로 이루어져 있습니다.
cafe_main_window = driver.find_element(id: 'cafe_main')

# 콘텐츠 프레임으로 전환합니다.
driver.switch_to.frame(cafe_main_window)

# 출석체크하면서 남길 문구입니다.
text = '노용우 매크로맨'

# 출첵 문구를 출첵 텍스트 필드에 입력해줍니다.
driver.find_element(id: 'content').send_keys(text)

# 입력한 문구를 출첵 게시판에 저장합니다.
driver.execute_script("submitForm();")

# 자동으로 출첵이 된 것을 8초간 감상합니다. Zzz...  35번 줄의 코드와 동일합니다. 
sleep(8)

# 브라우저를 종료합니다. 창닫기 버튼 눌러서 종료하는것도 귀찮으니까 코드로 해결합니다.
driver.close
