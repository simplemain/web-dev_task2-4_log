## web开发::任务2-4::日志

加入log库，打印相关访问日志，方便跟踪、调试和统计

### 下载源代码
* git clone 最新的代码

### 修改配置
* 修改conf/db文件，设置为自己数据库的参数

### 编译
* 切换到项目的目录，然后运行ant

### 运行
* 编译后产生run文件，然后运行 <br>
windows: run <br>
linux: ./run debug <br>
mac: ./run debug <br>

### 浏览器访问
* 浏览器访问 http://localhost:8080/user.action

### 修改java文件
* 修改 src/com/simplemain/action/UserAction.action 文件，增加相关调试的日志
* 打开logs目录下的日志文件，统计相关访问请求的信息
