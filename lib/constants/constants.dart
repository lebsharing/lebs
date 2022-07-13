class Constants {
  static const addChildAction = -100; //Drawer添加学生的动作

  //试听课
  static const int trialCourse = 0;
  //正式课
  static const int normalCourse = 1;

  ///班型
  static const int classType1V1 = 1; //1v
  static const int classTypeSmall = 2; //小班课

  ///0：已取消；1：未开始；2：开始上课；3：正常结束；4：异常结束
  static const int classStatusStart = 2;
  static const int classStatusNormal = 3;
  static const int classStatusAbnormal = 4;
}
