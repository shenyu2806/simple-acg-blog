<!-- 登录注册 -->
<template>
    <div>
        <div class="container">
            <h1 class="loginTitle">

            </h1>
            <!-- 登录注册 -->
            <div  class="">
                <div v-if="login===1" class="loginBox">
                    <div class="lr-title">
                        <h1>登录</h1>
                        <p>
                            新用户<a href="/Login?login=0" class="tcolors">注册</a>
                        </p>
                    </div>
                    <el-alert
                        v-show="loginErr"
                        :title="loginTitle"
                        type="error"
                        show-icon  :closable="false">
                    </el-alert>
                    <el-input
                        type="text"
                        placeholder="用户名"
                        v-model="username">
                    </el-input>

                    <el-input
                            type="password"
                          placeholder="密码"
                           @keyup.enter.native="loginEnterFun"
                          v-model="password">
                    </el-input>

                    <h3><a href="">忘记密码？</a></h3>
                    <div class="lr-btn tcolors-bg" @click="gotoHome">登录</div>
                    <div class="otherLogin" >
                        <a href="javascript:void(0)"><i class="fa fa-fw fa-wechat"></i></a>
                        <a href="javascript:void(0)"><i class="fa fa-fw fa-qq"></i></a>
                        <a href="javascript:void(0)"><i class="fa fa-fw fa-weibo"></i></a>
                    </div>
                </div>
                <div v-else class="registerBox">
                    <div class="lr-title">
                        <h1>注册</h1>
                        <p>
                            已有账号<a href="/Login?login=1" class="tcolors">登录</a>
                        </p>
                    </div>
                    <el-alert
                        v-show="registerErr"
                        :title="registerTitle"
                        type="error"
                        show-icon  :closable="false">
                    </el-alert>
                    <el-input
                        type="text"
                        placeholder="用户名"
                        v-model="nusername">
                    </el-input>
                    <el-alert
                        v-show="nusernameErr"
                        title="用户名不能为空"
                        type="error"
                        show-icon  :closable="false">
                    </el-alert>
                    <el-alert
                      v-show="nusernameisexistErr"
                      title="用户名已存在"
                      type="error"
                      show-icon  :closable="false">
                    </el-alert>
                    <el-input
                        type="text"
                        placeholder="昵称"
                        v-model="nnickName">
                    </el-input>
                    <el-input
                        type="email"
                        placeholder="邮箱"
                        v-model="nemail">
                    </el-input>
                    <el-alert
                        v-show="nemailErr"
                        title="邮箱格式错误"
                        type="error"
                        show-icon  :closable="false">
                    </el-alert>
                  <el-alert
                    v-show="nemailNullErr"
                    title="邮箱不能为空"
                    type="error"
                    show-icon  :closable="false">
                  </el-alert>
                    <el-input
                          type="password"
                          placeholder="密码:4-12位英文、数字、下划线"
                          v-model="npassword">
                    </el-input>
                    <el-alert
                        v-show="npasswordErr"
                        title="密码错误"
                        type="error"
                        show-icon  :closable="false">
                    </el-alert>
                    <el-input
                            type="password"
                          placeholder="确认密码"
                           @keyup.enter.native="registerEnterFun"
                          v-model="npassword2">
                    </el-input>
                    <el-alert
                        v-show="npassword2Err"
                        title="重复密码有误"
                        type="error"
                        show-icon  :closable="false">
                    </el-alert>
                  <template>
                    <div class="sex">
                      <span class="leftTitle">性别</span>
                      <template>
                        <el-radio class="radio" v-model="sex" label="0">男</el-radio>
                        <el-radio class="radio" v-model="sex" label="1">女</el-radio>
                      </template>
                    </div>
                  </template>



                  <div class="lr-btn tcolors-bg" @click="newRegister" v-loading.fullscreen.lock="fullscreenLoading"  element-loading-text="提交中">注册</div>
                </div>
            </div>

        </div>
    </div>
</template>

<script>
import {userLogin,userRegister,checkEmail,checkUsername} from '../api/user.js'
import {setToken} from '../utils/auth.js'
    export default {
        name: 'Login',
        data() { //选项 / 数据
            return {
                username: '',//用户名
                nnickName: '',//昵称
                email: '',//邮箱
                password: '',//密码
                nusername: '',//新用户注册名
                nemail: '',//新用户注册邮箱
                npassword: '',//新用户注册密码
                npassword2: '',//新用户注册重复密码
                login: 0,//是否已经登录
                loginErr: false,//登录错误
                loginTitle:'用户名或密码错误',
                nusernameErr:false,//新用户注册用户名错误
                nusernameisexistErr:false,//新用户注册用户名已存在
                nemailErr: false,//新用户注册邮箱格式错误
                nemailNullErr: false,//新用户注册邮箱不为空错误
                npasswordErr: false,//新用户注册密码错误
                npassword2Err: false,//新用户注册重复密码错误
                registerErr: false,//已注册错误
                registerTitle: '该邮箱已注册',
                step: 1,//注册进度
                fullscreenLoading: false,//全屏loading
                urlstate: 0,//重新注册
                sex: '0',
                demo: 0,  //测试箭头函数的this
            }
        },
        methods: { //事件处理器
            routeChange:function(){
                var that = this;
                that.login = that.$route.query.login==undefined?1:parseInt(that.$route.query.login);//获取传参的login
                that.urlstate = that.$route.query.urlstate==undefined?0:that.$route.query.urlstate;//获取传参的usrlstate状态码
                // console.log(that.login,that.urlstate);

            },
            loginEnterFun: function(e){
                var keyCode = window.event? e.keyCode:e.which;
                // console.log('回车登录',keyCode,e);
                if(keyCode == 13 ){
                    this.gotoHome();
                }
            },
            gotoHome:function(){//用户登录
                userLogin(this.username,this.password).then((response)=>{
                    // 登录成功记录token和用户信息，登录失败给对应提示
                    setToken(response.token)
                    // 存储用户信息
                    localStorage.setItem("userInfo",JSON.stringify(response.userInfo))
                    if(localStorage.getItem('logUrl')){
                        this.$router.push({path:localStorage.getItem('logUrl')});
                    }else{
                        this.$router.push({path:'/'});
                    }
                })

            },
            registerEnterFun: function(e){
                var keyCode = window.event? e.keyCode:e.which;
                // console.log('回车注册',keyCode,e);
                if(keyCode == 13 ){
                    this.newRegister();
                }
            },
            newRegister:async function () {//注册提交
              var that = this;
              // 再次点你注册提交的话应该把上一次的错误信息清除掉（即再一次将错误标志变为初始值false）
               that.InitErrFlag(that)
               that.pritfln(that)
              console.log('that--------------------',that)


              //  判断邮箱是否注册
              await checkEmail(that.nemail).then(res => {
                console.log('----(res)nemail--------', res)
                let emails = res
                if (emails != null && emails.length > 0) {
                  that.registerErr = true
                }
                console.log('----(res)registerErr--------', that.registerErr)

              }).catch((error) => {
                that.$message.error(error)

              })


              var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
              var preg = /^(\w){4,12}$/;
              if (that.nusername) {
                // 当用户输入的用户名不为null时
                that.nusernameErr = false;
                // 判断用户名是否存在
                await checkUsername(that.nusername).then(res => {
                  that.nusernameisexistErr = res
                }).catch((error) => {
                  that.$message.error(error)

                })
              } else {
                // 当用户输入的用户名为null时
                that.nusernameErr = true;
              }

              console.log('输出用户名的错误标志')
              console.log('nusernameErr--null',that.nusernameErr)
              console.log('nusernameisexistErr--is',that.nusernameisexistErr)

              if (!that.nemail){
              //   如果邮箱为空
                this.nemailNullErr = true
              } else if (reg.test(that.nemail)) {
                that.nemailErr = false;
              } else {
                that.nemailErr = true;
              }
              if (that.npassword && preg.test(that.npassword)) {
                that.npasswordErr = false;
                that.npassword2Err = that.npassword !== that.npassword2;
              } else {
                that.npasswordErr = true;
              }
              console.log('nusernameErr', that.nusernameErr)
              console.log('registerErr', that.registerErr)
              if (!that.nusernameErr && !that.nemailErr && !that.registerErr&& !that.nusernameisexistErr && !that.npasswordErr) {
                that.fullscreenLoading = true;
                await userRegister(that.nusername, that.nnickName, that.nemail, that.npassword, that.sex).then((response) => {
                  //注册成功后调整到登录
                  that.goLogin()
                }).catch((error) => {
                  that.fullscreenLoading = false;
                })
              }
            },

            // 错误标志再次初始化
            InitErrFlag: (that) =>{
                that.nusernameErr = false//新用户注册用户名错误
                that.nusernameisexistErr=false//新用户注册用户名已存在
                that.nemailErr= false//新用户注册邮箱错误
                that.npasswordErr= false//新用户注册密码错误
                that.npassword2Err= false//新用户注册重复密码错误
                that.registerErr= false//已注册错误
                that.nemailNullErr= false//已注册错误
                that.demo= 1//测试箭头函数的this
            },
            // 测试输出
            pritfln: (that) => {
              console.log(that.nusernameErr)
              console.log(that.nusernameisexistErr)
              console.log(that.nemailErr)
              console.log(that.npasswordErr)
              console.log(that.npassword2Err)
              console.log(that.registerErr)
              console.log(that.nemailNullErr)
              console.log(that.demo)//测试箭头函数的this

            },
            goLogin:function(){//去登陆
                this.$router.push({path:'/Login?login=1'});
            },
            goRegister: function(){//去注册
                this.$router.push({path:'/Login?login=0'});
            }

        },
        components: { //定义组件

        },
        watch: {
           // 如果路由有变化，会再次执行该方法
           '$route':'routeChange'
         },
        created() { //生命周期函数
            var that = this;
            that.routeChange();
        }
    }
</script>

<style>
/*登录注册标题*/
.loginTitle{
    text-align: center;
    font-size: 26px;
    padding-top:50px;
    margin-bottom: 20px;
}
.loginBox ,.registerBox{
    background: #fff;
    padding:40px;
    max-width:320px;
    margin:0 auto;
}
.loginBox{
    padding-bottom:0;
}
.lr-title{
    position: relative;
    height:32px;
    line-height: 32px;
    margin-bottom: 20px;
}
.lr-title h1{
    font-size: 24px;
    color:#666;
    font-weight: bold;
    /*width:50%;*/
}
.lr-title p{
    font-size: 12px;
    color:#999;
    position: absolute;
    right:0;
    top:0;
}
.lr-btn{
    color:#fff;
    text-align: center;
    letter-spacing: 5px;
    padding:8px;
    border-radius: 5px;
    cursor: pointer;
    margin-bottom: 30px;
}
.loginBox .el-input,.registerBox .el-input{
    margin-bottom: 20px;
}
.loginBox .el-alert ,.registerBox .el-alert{
    top:-18px;
    background-color: #888;
}
.loginBox .el-input input,.registerBox .el-input input{
    border-radius: 4px;
}
.loginBox h3,.registerBox h3{
    text-align: right;
    margin-bottom: 20px;
}
.loginBox h3 a,.registerBox h3 a{
    font-size: 13px;
    color:#999;
}
.loginBox .otherLogin{
    max-width:320px;
    padding:30px 40px;
    background: #ddd;
    text-align: center;
    margin-left:-40px;
    margin-right: -40px;
    visibility: hidden;
}
.loginBox .otherLogin p{
    margin-bottom:20px;
    font-size: 16px;
}
.loginBox .otherLogin a i{
    display: inline-block;
    width: 42px;
    height: 42px;
    line-height: 42px;
    font-size: 18px;
    border-radius: 50%;
    color:#fff;
    margin: 0 10px;
}
.loginBox .otherLogin a i.fa-wechat{
    background: #7bc549;
}
.loginBox .otherLogin a i.fa-qq{
    background: #56b6e7;
}
.loginBox .otherLogin a i.fa-weibo{
    background: #ff763b;
}

/*登录成功*/
.registerSuc{
    padding: 40px;
    margin: 0 auto;
}
.registerSuc .sucIcon{
    text-align: center;
    margin-bottom: 30px;
    padding-left:60px;
}
.registerSuc .sucContent{
    line-height: 1.5;
    font-size: 15px;
    text-align: center;
}
.registerSuc .sucContent p{
    margin-top: 10px;
    font-size: 13px;
    color: #999;
}
.registerSuc .sucContent .lastbtn{
    display: inline-block;
    font-size: 14px;
    padding: 3px 10px;
    border-radius: 5px;
    color:#fff;
    cursor: pointer;
}
.registerSuc .sucContent  .el-icon-close{
    fong-size: 13px;
}
.leftTitle{
  display: inline-block;
  width:70px;
  padding: 0px 10px;
  padding-bottom: 12px;
}
.sex{
  /*padding:10px;*/
  border-bottom: 1px solid #ddd;
}
.radio {
  padding: 0px 20px;
}
</style>
