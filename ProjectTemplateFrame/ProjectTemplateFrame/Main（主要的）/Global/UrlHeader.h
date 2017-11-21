//
//  UrlHeader.h
//  LoveE
//
//  Created by 黄雄彪 on 16/4/16.
//  Copyright © 2016年 huangxiongbiao. All rights reserved.
//

#ifndef UrlHeader_h
#define UrlHeader_h

//外网部署zms地址
//http://120.55.117.108:8383/zms
//外网部署userapp地址
//http://120.55.117.108:8383/userapp

//外网地址
#define kHost @"http://localhost:8080"

//测试ip地址
//#define kHost @"http://192.168.0.100:8080/userapp/"
//#define kHost @"http://192.168.0.102:8080/userapp/"
//#define kHost @"http://192.168.0.105:8080/userapp/"

#define kTestUrl kHost@"/test"

#pragma mark===============登录相关==================
/**
 *  手机号获取验证码
 *
 *  @param      phone  ?phone=12345678932
 *
 *  返回：{"status":500,"data":"942062"} 成功！
 *	{"status":501,"data":"获取手机验证码失败！"}
 */
#define kGetPhoneVertifyUrl kHost@"user/getVerifyCodeByPhone"

/**
 *  用户注册接口
 *  phone=12345678932&verifyCode=4384783&password=123456"
 *  @param      phone
 *  @param      verifyCode
 *  @param      password
 *  返回：{"status":501,"data":"验证码错误,请稍后再试！"}
 *   {"status":500,"data":"注册成功！"}
 *	{"status":502,"data":"您已注册,请去登录！"}
 */
#define kUseRegisterUrl kHost@"user/register"

/**
 *  用户忘记密码接口
 *  phone=12345678932&verifyCode=4384783&password=123456"
 *  @param      phone
 *  @param      verifyCode
 *  @param      newPwd
 *  返回：{"status":501,"data":"验证码错误,请稍后再试！"}
 *   {"status":500,"data":"注册成功！"}
 *	{"status":502,"data":"您已注册,请去登录！"}
 */
#define kSetNewPwdUrl kHost@"user/setNewPwd"

/**
 *  普通登录方式
 *  ?phone=12345678933&password=123456
 *  @param      phone，
 *  @param      password
 *
 */
#define kLoginCommonUrl kHost@"user/loginCommon"

/**
 *  device_token更新接口
 *
 *  @param      userid	是	string	用户id
 *  @param      device_token	否	string	友盟消息推送服务对设备的唯一标识（登录时必填）
 *  @param      ispush	是	string	是否推送(0-不推送，1-推送)
 *
 */
#define kSetDeviceTokenUrl kHost@"user/setDeviceToken"

/**
 *  快捷登录
 *  ?phone=12345678933&verifyCode=123458
 *  @param      phone
 *  @param      verifyCode
 *  返回：{"status":501,"data":"验证码有误！"}
 *	{"status":500,"data":{"datecreated":1466051204000,"返回同上
 *
 */
#define kLoginQuicklyUrl kHost@"user/loginQuickly"


/**
 *  根据userid查询身份证信息接口
 *
 *  @param      userid	是	string	用户id
 *
 */
#define kGetCard kHost@"cardInfo/findByUserid"

/**
 *  保存或新增身份证信息接口
 *
 *  @param      userid	是	string	用户id
 *  @param      cardno	是	string	身份证号码
 *  @param      cardtype	是	string	证件类型
 *  @param      name	是	string	姓名
 *  @param      gender	否	string	性别
 *  @param      birth	否	string	出生年月日
 *  @param      nation	否	string	民族
 *  @param      hometown	否	string	籍贯
 *  @param      address	否	string	地址
 *  @param      front	否	MultipartFile	身份证正面图片（以multipart/form-data方式上传）
 *  @param      reverse	否	MultipartFile	身份证反面图片 （以multipart/form-data方式上传）
 *  @param      head	否	MultipartFile	身份证头像 （以multipart/form-data方式上传）
 *  @param      face	否	MultipartFile	人脸识别照片（以multipart/form-data方式上传）
 */
#define kSaveCard kHost@"cardInfo/saveInfo"

/**
 *  人脸认证接口
 *
 *  @param      userid 	是 	string 	用户id
 *  @param      delta 	是 	string 	face++的MegLive SDK中返回的delta字符串
 *  @param      face 	是 	MultipartFile 	活体检测头像（以multipart/form-data方式上传）
 *
 */
#define kCompareCard kHost@"cardInfo/compareCardAndFace"

/**
 *  意见反馈
 *
 *  @param      userid	是	string	用户id
 *  @param      content	是	string	意见反馈内容
 *
 */
#define kFeedBackUrl kHost@"feedBack/save"

#pragma mark===============个人信息相关==================
/**
 *  获取个人信息集合
 *  userId=27b180a0-ecff-41c1-8fb7-ca1c951ca29a&nickname=%E4%BD%A0%E5%A5%BD%E4%BD%A0%E5%A5%BD&type=1
 *  @param      String userId,
 *  返回：500 成功！ 501 失败！
 */
#define kGetUserInfoUrl kHost@"user/getInfoByUserId"
/**
 *  修改个人信息集合
 *  userId=27b180a0-ecff-41c1-8fb7-ca1c951ca29a&nickname=%E4%BD%A0%E5%A5%BD%E4%BD%A0%E5%A5%BD&type=1
 *  @param      String userId,
 *  @param      String nickname,
 *  @param      String truename,
 *  @param      String cardno,
 *  @param      String gender,
 *  @param      Integer type
 *  当type=1时  修改  nickname(昵称)
 *  当type=2时  修改  truename 和cardno（省份证）
 *  当type=3时  修改  gender（性别）
 *  返回：500 成功！ 501 失败！
 */
#define kEditUserInfoByTypeUrl kHost@"user/editUserInfoByType"

/**
 *  保存常用发票抬头
 *  ?userId=27b180a0-ecff-41c1-8fb7-ca1c951ca29a
 *   content=%E6%9D%AD%E5%B7%9E%E6%80%9D%E6%B1%89%E7%A7%91%E6%8A%80%E6%9
 *  @param      userId
 *  @param      content
 *
 *  返回：{"status":500,"data":"保存成功！"}
 *	{"status":502,"data":"信息重复保存"}
 *	{"status":501,"data":"保存失败！"}
 */
#define kSaveInvoiceTitlesUrl kHost@"invoiceTitles/saveInvoiceTitles"

/**
 *  编辑常用发票抬头
 *  ?userId=27b180a0-ecff-41c1-8fb7-ca1c951ca29a
 *   content=%E6%9D%AD%E5%B7%9E%E6%80%9D%E6%B1%89%E7%A7%91%E6%8A%80%E6%9
 *  @param      invoicetitleid
 *  @param      content
 *
 *  返回：{"status":500,"data":"保存成功！"}
 *	{"status":502,"data":"信息重复保存"}
 *	{"status":501,"data":"保存失败！"}
 */
#define kEditInvoiceTitlesUrl kHost@"invoiceTitles/editInvoiceTitles"

/**
 *  删除发票抬头
 *  ?invoiceTitlesId=6f0592f7-ad72-4364-805f-0769835bad56
 *  @param      invoiceTitlesId 发票id
 *
 *  返回：{"status":500,"data":"删除成功！"}
 *	{"status":501,"data":"删除失败！"}
 *
 */
#define kDeleteInvoiceTitlesUrl kHost@"invoiceTitles/deleteInvoiceTitles"

/**
 *  查询所有发票抬头
 *  ?userId=27b180a0-ecff-41c1-8fb7-ca1c951ca29a
 *  @param      userId
 *
 *  {"userid":"27b180a0-ecff-41c1-8fb7-ca1c951ca29a",
 *   "datecreated":1466006400000,
 *   "isdel":false,
 *   "invoicetitleid":"b6265d28-d3af-4296-b77b-1f110b16b542",
 *   "content":"杭州思汉科技有限公司"
 *
 */
#define kInvoiceTitlesListUrl kHost@"invoiceTitles/findInvoiceTitlesByUserId"

/**
 *  保存常用邮件地址
 *  ?userId=27b180a0-ecff-41c1-8fb7-ca1c951ca29a&receiver=%E8%B4%A6%E5%8F%B7&phone=1233445677864&region=%E5%8C%97%E4%BA%AC&address=%E6%9C%9D%E9%98%B3%E5%8C%BA
 *  @param      String userId,
 *  @param      String receiver（收件人）,
 *  @param      String phone,
 *  @param      String region（所在地区）,
 *  @param      String address（详细地址）,
 *  @param      Integer zipcode（邮编可为空）
 */
#define kSaveMailAddressUrl kHost@"mailAddress/saveMailAddress"

/**
 *  编辑常用邮件地址
 *  ?userId=27b180a0-ecff-41c1-8fb7-ca1c951ca29a&receiver=%E8%B4%A6%E5%8F%B7&phone=1233445677864&region=%E5%8C%97%E4%BA%AC&address=%E6%9C%9D%E9%98%B3%E5%8C%BA
 *  @param      String mailAddressId,
 *  @param      String receiver（收件人）,
 *  @param      String phone,
 *  @param      String region（所在地区）,
 *  @param      String address（详细地址）,
 *  @param      Integer zipcode（邮编可为空）
 */
#define kEditMailAddressUrl kHost@"mailAddress/editMailAddress"

/**
 *  删除常用邮件地址
 *  ?mailAddressId=9b1f8b09-4cbc-44ac-9a57-dfc0963fc106
 *  @param      mailAddressId
 *
 */
#define kDeleteMailAddressUrl kHost@"mailAddress/deleteMailAddress"

/**
 *  查找用户所有邮寄地址列表
 *  ?userId=27b180a0-ecff-41c1-8fb7-ca1c951ca29a
 *  @param      userId
 * 
 *
 */
#define kMailAddressListUrl kHost@"mailAddress/findMailAddressListByUserId"

/**
 *  常用住客信息添加
 *  ?userId=27b180a0%84%E5%82%B2&
    phone=12222222234&
    email=1321@qq.com&
    cardtype=1&cardno=34252364653445321"
 *  @param      String userId,
 *  @param      String name,
 *  @param      String phone,
 *  @param      String email,
 *  @param      String cardtype,
 *  @param      String cardno
 */
#define kSaveHabitueUrl kHost@"habitue/saveHabitue"

/**
 *  常用住客信息编辑
 *  ?userId=27b180a0%84%E5%82%B2&
 phone=12222222234&
 email=1321@qq.com&
 cardtype=1&cardno=34252364653445321"
 * @param habitueId
 * @param name
 * @param phone
 * @param email
 * @param cardtype
 * @param cardno
 */
#define kEditHabitueUrl kHost@"habitue/editHabitue"
/**
 *  删除常用住客信息
 *  ?habitueId=0005a4d0-96b2-466a-953e-2ba25749d2f6
 *  @param      habitueId
 *
 */
#define kDeleteHabitueUrl kHost@"habitue/deleteHabitue"

/**
 *  常用住客信息列表
 *
 *  @param      userId
 *
 *   {"userid":"27b180a0-ecff-41c1-8fb7-ca1c951ca29a",
 *   "datecreated":1466006400000,
 *   "isdel":false,
 *   "habitueid":"0005a4d0-96b2-466a-953e-2ba25749d2f6",
 *   "name":"张骄傲",
 *   "cardtype":"1",
 *   "cardno":"34252364653445321",
 *   "phone":"12222222234",
 *   "email":"1321@qq.com"}
 */
#define kHabitueListUrl kHost@"habitue/findHabitueListByUserId"


/**
 *  增加足迹
 *  ?itemids="9,10"&  userId=27b180a0-ecff-41c1-8fb7-ca1c951ca29a
 *  @param      itemid (酒店ID数组，逗号隔开)
 *  @param      userId
 *
 */
#define kAddFootPrintUrl kHost@"footPrint/addFootPrintByUserId"
/**
 *  删除足迹
 *  ?itemids="9,10"&  userId=27b180a0-ecff-41c1-8fb7-ca1c951ca29a
 *  @param      itemids (酒店ID数组，逗号隔开)
 *  @param      userId
 *
 */
#define kDeleteFootPrintByItemidsUrl kHost@"footPrint/deleteFootPrintByUserId"

/**
 *  用户足迹列表
 *
 *  @param  userId
 *  @param
 *  @param
 *  @param      
 */
#define kGetFootPrintHotelListUrl kHost@"footPrint/getHotelListByFootPrint"


/**
 *  获取酒店收藏状态
 *
 *  @param      String hotelId（酒店Id）,
 *  @param      String userId(),
 *
 */
#define kGetFavoriteStatusUrl kHost@"footPrint/isCollect"

/**
 *  收藏酒店
 *  ?itemid=1&userId=27b180a0-ecfa&isFavorite=1
 *  @param      String itemid（酒店Id）,
 *  @param      String userId(),
 *  @param      Integer isFavorite(是否收藏传1代表点击收藏，2表示点击取消收藏)
 *
 */
#define kEditFavoriteUrl kHost@"footPrint/editFavoriteByUserId"

/**
 *  查询用户收藏酒店列表
 *
 *  @param      userId
 *
 */
#define kFavoriteListUrl kHost@"footPrint/getHotelListByFavortite"


/**
 *  删除收藏
 *  ?itemids=?&userId=
 *  @param      String itemids（用逗号隔开的字符串）
 *  @param      String userId
 *
 */
#define kDeleteFavoriteUrl kHost@"footPrint/deleteFavorite"

#pragma mark===============管家订单相关==================
/**
 *  获取订单房间等信息（管家内取订单信息）
 *
 *  @param      userId
 *
 */
#define kFindOrderRoomInfoUrl kHost@"userOrder/findRoomInfoByUserId"

/**
 *  可选房间列表接口
 *
 *  @param hotelId
 *  @param roomType
 *  @param startTime
 *  @param endTime
 *  @param roomface  房间偏好 用逗号隔开，
 */
#define kGetChoosableRoomByParams kHost@"user/getChoosableRoomByParams"

/**
 *  选房结果保存
 *
 *  @param roomdIds 房间id数组(逗号隔开)
 *  @param orderId  订单id
 *
 */
#define kChooseRoomResultInfoUrl kHost@"userOrder/chooseRoomResultInfo"

/**
 *  换房
 *
 *  userorderid	是	string	订单id
 *   newRoomId	是	string	新房id
 *   oldRoomId	是	string	旧房id
 *
 */
#define kChangRoomUrl kHost@"userOrder/changRoom"

/**
 *  根据userOrderId由电脑随机选房
 *
 *  @param      userOrderId 订单Id
 *  @param      返回：500/501  , 成功或失败
 *  @param
 */
#define kRandomSelectRoomUrl kHost@"userOrder/randomSelectRoomByUserOrderId"

/**
 *  房间账单接口
 *
 *  @param      roomId	是	string	房间Id
 *
 */
#define kGetBillInfoUrl kHost@"fromZms/getBillInfoByRoomId"

/**
 *  自主入住接口
 *
 *  @param      roomId	是	string	房间Idname	是	string	姓名
 *   cardno	是	string	身份证号码
 *   delta	是	string	face++的MegLive SDK中返回的delta字符串
 *   face	是	MultipartFile	活体检测头像（以multipart/form-data方式上传）
 *   roomid	是	string	房间id
 *   orderid	是	string	订单id
 *
 */
#define kAutoCheckinUrl kHost@"userOrder/autoCheckin"

#pragma mark===============订单相关==================
/**
 *  酒店订单列表接口
 *
 *  @param      userid：用户id
 *  @param      type：1(全部)、2(有效单)、3(未支付)、4(退款单)
 *  @param      page：页码
 *  @param      pageSize:每页显示行数
 */
#define kFindOrderUrl kHost@"userOrder/findOrder"

/**
 *  订单费用明细接口
 *
 *  @param      billid：订单id
 *
 */
#define kFindByBillidUrl kHost@"costDetail/findByBillid"

/**
 *  订单处理日志查询接口
 *
 *  @param      userorderid：订单id
 *
 */
#define kOrderStatusScanUrl kHost@"processLog/queryByUserorderid"

/**
 *  订单支付
 *
 *  @param      userorderid：订单id
 *
 */
#define kOrderPayStringUrl kHost@"alipays/alipayStr"

/**
 *  订单取消
 *
 *  @param      orderid	是	string	订单id
    userid	是	string	用户id
    reason	是	String	订单取消原因 
 */
#define kCancelOrderUrl kHost@"userOrder/cancelOrder"

/**
 *  订单取详情
 *
 *  @param      orderid	是	string	订单id
 */
#define kOrderDetailUrl kHost@"userOrder/findOrderById"

#pragma mark===============评价相关==================
/**
 *  评价查询接口
 *（注意：以上有三种情况
 （只传酒店id，不传用户id）
 （只传用户id，不传酒店id）
 （酒店id和用户id都传）
 *  @param      hotelid：酒店id
 *  @param      userid：用户id
 *  @param      page：页码
 *  @param      pageSize：每页显示行数
 */
#define kHotelCommentDetailUrl kHost@"comment/HotelCommentDetail"

/**
 *  未评价订单接口
 *
 *  @param      userid：用户id
 *  @param      page：页码
 *  @param      pageSize：每页显示行数
 *
 */
#define kNotCommentUrl kHost@"userOrder/notComment"

/**
 *  评价提交接口
 *
 *  @param      hotelId		酒店id
 *  @param      userid		用户id
 *  @param      userorderid 订单id
 *  @param      facilitystars	设施评分
 *  @param      hygienestars	卫生评分
 *  @param      servicestatrs	服务评分
 *  @param      networkstars	网络评分
 *  @param      content		评语内容
 *  @param      anonymous		是否匿名（true：匿名   false：不匿名）
 *
 */
#define kPostCommentUrl kHost@"comment/subComment"

/**
 *  消息列表接口
 *
 *  @param      userid：用户id
 *  @param      page：页码
 *  @param      pageSize：每页显示行数
 *
 */
#define kMessageNotificationUrl kHost@"message/findMessageByUserid"

#pragma mark===============管家功能相关==================
/**
 *   退房
 *
 *  @param      String hotelid, //酒店id
 *  @param      String roomcode//房号
 *
 */
#define kCheckOutUrl kHost@"userOrder/checkOut"

/**
 *   预约打扫
 *
 *  @param      userid	是	string	用户id
 *   time	是	string	预约时间（具体的时间点，例如：12:00,13:00等等）
 *   roomid	是	string	房间id
 *  remark	否	string	备注
 *  type	是	string	预约时间类型(1-今天，2-明天，3-后天)
 *
 */
#define kAppointCleanUrl kHost@"userOrder/bookingClean"

/**
 *  列出所有可开门的lockKey
 *
 *  @param
 *  @param
 *  @param
 *  @param
 */
#define kListAllOpenableUrl kHost@"lockKey/listAllOpenable"

/**
 *  开门密码
 *
 *  @param      userId=3
 *
 */
#define kOpenKeyUrl kHost@"user/getDoorPwd"


/**
 *  开门
 *
 *  @param      hotelid=2
 *  @param      roomcode=8908
 *  @param      userId=3
 *
 */
#define kOpenDoorUrl kHost@"lockKey/openDoor"


/**
 *  头像上传
 *
 *  @param      userId
 *  @param      mf
 *
 */
#define kUploadHeadImageUrl kHost@"user/uploadPictrue"

#pragma mark===============酒店首页相关==================

/**
 *  酒店设施详情接口
 *
 *  @param      hotelId	是	string	酒店Id
 *
 */

#define kHotelServicesUrl kHost@"hotel/getSomeHotelInfoById"
/**
 *  酒店房间图片接口
 *
 *  @param      hotelId	是	string	酒店Id
 *
 */

#define kGetPitureListUrl kHost@"media/getPitureListByHotelId"

/**
 *  酒店搜索接口
 *
 *  @param      iveType 入住类型
 *  @param      baiduLat 纬度
 *  @param      baiduLon 经度
 *  @param      checkInTime 入住时间
 *  @param      checkOutTime 离店时间
 *  @param      keyword 关键字
 *  @param      LowRate 最低价
 *  @param      starRate 挂牌星级 （0-无星级；1-一星级；2-二星级；3-三星级；4-四星级；5-五星级）
 *  @param      orderType 排序类型 (1,低价排序 2，高价排序 3，评分排序)
 *  @param      isEconomic 是否经济型 （0非经济型，1代表是经济型酒店）
 *  @param      features 特色信息
 *  @param      score 评分
 *  @param      facilities 设施列表(用逗号隔开)
 */
#define kSearchHotelUrl kHost@"hotel/getHotelInfoByParams"

/**
 *  酒店详情接口
 *
 *  @param       hotelId 	是 	string 	酒店Id
 *
 */
#define kHotelDetailUrl kHost@"hotel/getHotelDetailById"

/**
 *  酒店可供入住房间接口
 *
 *  @param      hotelId 	是 	string 	酒店Id
 *  @param     startTime 	是 	string 	入住时间
 *  @param     endTime 	否 	string 	离店时间
 */
#define kGetBookRoomListUrl  kHost@"roomType/getRoomTypeInfoByHotelId"

/**
 *  区域位置接口
 *
 *  @param      cityName	是	string	城市名称
 *
 */
#define kLocationUrl kHost@"hotelGeo/location"

/**
 *  订单提交接口
 *
 *  @param      userid	是	string	用户id
 *  @param      datarpid	是	string	产品id
 *  @param      keepuntil	是	string	最晚到店时间
 *  @param      liveTime	是	string	入住时间
 *  @param      leaveTime	是	string	离店时间
 *  @param      roomCount	是	string	房间数
 *  @param      objCus	是	String	客人信息，字符串类型的json
 *  @param      name	是	string	联系人姓名
 *  @param      phone	是	string	联系人手机号码
 *  @param      roomtypeid	是	string	房型
 *  @param      hotelid	是	string	酒店id
 *  @param      numberOfCustomer	是	string	客人数量
 *  @param      source	是	string	来源（1-自身，2-艺龙
 *  @param      totalcost	是	string	订单总额
 *
 */
#define kOrderSubmitUrl kHost@"userOrder/orderSubmit"

/**
 *  订单账单详情
 *
 *  @param      datarpid	是	string	产品id
 *  @param      liveTime	是	string	入住时间
 *  @param      leaveTime	是	string	离店时间
 *
 */
#define kOrderPriceUrl kHost@"dataRP/getTempBillByIdAndTime"


#endif /* UrlHeader_h */
