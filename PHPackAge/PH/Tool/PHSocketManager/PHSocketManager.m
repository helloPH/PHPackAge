//
//  PHSocketManager.m
//  PHPackAge
//
//  Created by wdx on 2017/2/24.
//  Copyright © 2017年 wdx. All rights reserved.
//

#import "PHSocketManager.h"
#import <sys/socket.h>
#import <sys/types.h>
#import <netinet/in.h>
#import <arpa/inet.h>

@interface PHSocketManager()
@property (nonatomic,assign)int clientSocket;

@end

@implementation PHSocketManager
static int CreateClinetSocket(){
    int ClinetSocket = 0;
    //创建一个socket，返回值为int。（注socket其实就是int类型）
    
    ClinetSocket = socket(AF_INET, SOCK_STREAM, 0);
   
    // 第一个参数addressFamily
    //第二个参数 type 表示 socket 的类型，通常是流stream(SOCK_STREAM) 或数据报文datagram(SOCK_DGRAM)
    //第三个参数 protocol 参数通常设置为0，以便让系统自动为选择我们合适的协议，对于 stream socket 来说会是 TCP 协议(IPPROTO_TCP)，而对于 datagram来说会是 UDP 协议(IPPROTO_UDP)。
    return ClinetSocket;
}
static int ConnectToServer(int client_socket,const char * server_ip,unsigned short port){
    // 生成一个sockaddr_in 类型结构体
    struct soc
    
    
}

-(void)initSocket{
    // 每次连接前 ， 先断开连接
    if (_clientSocket != 0) {
        [self disConnect];
        _clientSocket = 0;
    }
    //  创建客户端socket
    _clientSocket = CreateClinetSocket();
    
    // 服务器Ip
    const char * server_ip="127.0.0.1";
    //服务器端口
    short server_port=6969;
    //等于0说明链接失败
    
    
    
    
}


+(instancetype)share{
    static dispatch_once_t onceToken;
    static PHSocketManager * instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        [instance initSocket];
    });
    return instance;
}

@end
