*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***

*** Test Cases ***
user ซื้อของเล่นให้ลูกสาว เลือกวิธีการจัดส่งเป็น kerry และชำระเงินด้วยบัตรเครดิต visa และชำระเงินสำเร็จ
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้าท่ีซื้อ
    นำสินค้าใส่ตะกร้า
    ยืนยันการสั่งซื้อและชำระเงินด้วยบัตรเครดิตวีซ่าการ์ด
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    Open Browser    https://www.dminer.in.th/Product-list.html    chrome
    Wait Until Element Contains    id=productName-1    text=43 Piece Dinner Set
    Element Should Contain    id=productPrice-1    expected=12.95 USD

แสดงรายละเอียดสินค้า
    Click Button    id=viewMore-1
    Wait Until Element Contains    productName    43 Piece dinner Set
    Wait Until Element Contains    productBrand    CoolKidz
    Wait Until Element Contains    productPrice    12.95 USD

ระบุจำนวนสินค้าท่ีซื้อ
    Input Text    productQuantity    1

นำสินค้าใส่ตะกร้า
    Click Button    id=addToCart

ยืนยันการสั่งซื้อและชำระเงินด้วยบัตรเครดิตวีซ่าการ์ด
    Wait Until Element Contains    receiverName    ณัฐญา ชุติบุตร
    Wait Until Element Contains    recevierAddress    405/37 ถ.มหิดล ต.ท่าศาลา อ.เมือง จ.เชียงใหม่ 50000
    Wait Until Element Contains    recevierPhonenumber    0970809292
    Wait Until Element Contains    productName-1    43 Piece dinner Set
    Wait Until Element Contains    totalAmount   14.95 USD
    Click Button    id=confirmPayment
    Wait Until Element Contains    totalPrice    241.90 USD
    Input Text    cardNumber    4719700591590995
    Input Text    expiredMonth    7
    Input Text    expiredYear     20
    Input Text    cvv    752
    Input Text    cardName    Karnwat Wongudom
    Click Button    id=Payment

ขอบคุณ
    Wait Until Element Contains    notify    วันเวลาที่ชำระเงิน 1/3/2563 13:30:00 หมายเลขคำสั่งซื้อ 8004359103 คุณสามารถติดตามสินค้าผ่านช่องทาง Kerry ด้วยหมายเลข 1785261900
    Click Button    goHome