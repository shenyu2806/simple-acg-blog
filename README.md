## 博客介绍

<p align="center">
   基于Springboot + Vue2 开发的前后端分离博客
</p>

![](https://gitee.com/fs529/bote_images_url/raw/master/simple-acg-blog/a1.png)

## 运行环境
### 前端

node.js v20.1 | npm v9.6

#### 安装依赖

``` bash
cnpm i pnpm -g
cnpm i | pnpm i
//可能会遇到的错误
//1
/* cnpm i --save core-js/modules/es.array.push.js core-js/modules/es.error.cause.js 
core-js/modules/es.object.proto.js core-js/modules/es.regexp.dot-all.js 
core-js/modules/web.url-search-params.delete.js core-js/modules/web.url-search-params.has.js 
core-js/modules/web.url-search-params.size.js svg-baker-runtime/browser-symbol
出现这个，执行下面 */
cnpm i --save core-js
//2
/* npm install --save babel-runtime/core-js/get-iterator babel-runtime/core-js/json/stringify 
babel-runtime/core-js/object/keys babel-runtime/core-js/promise 
babel-runtime/helpers/asyncToGenerator babel-runtime/helpers/defineProperty 
babel-runtime/helpers/extends babel-runtime/helpers/objectWithoutProperties 
babel-runtime/helpers/typeof babel-runtime/regenerator
出现这个，执行下面 */
cnpm i --save babel-runtime
//3
cnpm i --save regenerator-runtime svg-baker-runtime vue-style-loader
```

#### 运行

```bash
npm run dev
```

### 后端
java v1.8 
### 账号
admin 123456