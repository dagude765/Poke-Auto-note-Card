空间 双扣记牌器
//默认空间

整型 双扣窗口句柄,双扣窗口进程句柄,双扣记牌器窗口句柄,游戏开始句柄,线程句柄
var 己2记录 = " ",右2记录 = " ",中2记录 = " ",左2记录 = " ",牌记录 = " "
整型 己牌数基址 = #02004518,右牌数基址,中牌数基址,左牌数基址
整型 己基址,右基址,中基址,左基址
整型 MAX = 10000
整型 己上一次剩余牌数,右上一次剩余牌数,中上一次剩余牌数,左上一次剩余牌数
整型 己本次剩余牌数,右本次剩余牌数,中本次剩余牌数,左本次剩余牌数
整型 己循环,右循环,中循环,左循环
整型 上一次总牌数 = 109,总牌数

var tile = array[108]

//开始按钮_点击操作
功能 开始_点击()
    
    双扣窗口句柄 = 窗口.找到窗口("四人双扣")
    双扣记牌器窗口句柄 = 窗口.找到窗口("双扣记牌器")
    窗口.置顶(双扣记牌器窗口句柄,true)
    双扣窗口进程句柄 = 进程.获取进程句柄("四人双扣")
    如果(双扣窗口句柄 == 0)
        
        辅助.消息框("请先进入四人双扣,并坐下!")
        
    否则
        双扣记牌器.查找基址()
        编辑框.设置文本("己2出牌框",类型.转字符型(己牌数基址))
        双扣记牌器.重置牌组()
        //座位号 = 进程.读byte(双扣窗口进程句柄,#51f910)
        //读左边2B出牌
        
        右牌数基址 = 己牌数基址 + #B8
        中牌数基址 = 右牌数基址 + #B8
        左牌数基址 = 中牌数基址 + #B8
        
        己基址 = 己牌数基址 + #28
        右基址 = 右牌数基址 + #28
        中基址 = 中牌数基址 + #28
        左基址 = 左牌数基址 + #28
        
        //游戏开始句柄 = 线程.开启("双扣记牌器.游戏开始","")
        线程句柄 = 线程.开启("双扣记牌器.线程开始","")
        //己线程句柄 = 线程.开启("双扣记牌器.读己出牌","")
        //右线程句柄 = 线程.开启("双扣记牌器.读右出牌","")
        //中线程句柄 = 线程.开启("双扣记牌器.读中出牌","")
        //左线程句柄 = 线程.开启("双扣记牌器.读左出牌","")
        
        
    如果结束
    
功能结束

功能 查找基址()
    
    己牌数基址 = #02004518
    
    for(i=0; i < 512; i++)
        己牌数基址 = 己牌数基址 + #10000
        num = 进程.读4byte(双扣窗口进程句柄,己牌数基址)
        if (num <= MAX)
            if (num == 27)
                break
            endif
        endif
    endfor
    
功能结束

功能 重置牌组()
    
    //for(i=0; i<97; i++)
    //for(j=0; j<8; j++)
    //tile[i+j] = i/8+3
    //endfor
    //i = i+7
    //endfor
    //tile[104] = 53
    //tile[105] = 53
    //tile[106] = 54
    //tile[107] = 54
    
    for(i=0;i<108;i++)
        tile[i] = 1
    endfor
    
功能结束

功能 游戏开始()
    
    //右牌数基址 = 己牌数基址 + #B8
    //中牌数基址 = 右牌数基址 + #B8
    //左牌数基址 = 中牌数基址 + #B8
    
    //己牌数 = 进程.读byte(双扣窗口进程句柄,己牌数基址)
    //右牌数 = 进程.读byte(双扣窗口进程句柄,右牌数基址)
    //中牌数 = 进程.读byte(双扣窗口进程句柄,中牌数基址)
    //左牌数 = 进程.读byte(双扣窗口进程句柄,左牌数基址)
    
    //整型 上一次总牌数 = 109
    
    总牌数 = 己本次剩余牌数+右本次剩余牌数+中本次剩余牌数+左本次剩余牌数
    if (总牌数 == 108)
        双扣记牌器.重置牌组()
        上一次总牌数 = 109
    endif
    if (总牌数 < 上一次总牌数)
        牌记录 = ""
        for (i=0;i<7;i++)
            for(j=0;j<8;j++)
                if(tile[i*8+j] != 0)    
                    牌记录 = 字符串.连接(牌记录,类型.转字符型(i+3))
                endif
            endfor
            牌记录 = 字符串.连接(牌记录,"\r\n")
        endfor
        
        for(j=0;j<8;j++)
            if(tile[56+j] != 0)    
                牌记录 = 字符串.连接(牌记录,"0")
            endif
        endfor
        牌记录 = 字符串.连接(牌记录,"\r\n")
        
        for(j=0;j<8;j++)
            if(tile[64+j] != 0)    
                牌记录 = 字符串.连接(牌记录,"J ")
            endif
        endfor
        牌记录 = 字符串.连接(牌记录,"\r\n")
        
        for(j=0;j<8;j++)
            if(tile[72+j] != 0)    
                牌记录 = 字符串.连接(牌记录,"Q")
            endif
        endfor
        牌记录 = 字符串.连接(牌记录,"\r\n")   
        
        for(j=0;j<8;j++)
            if(tile[80+j] != 0)    
                牌记录 = 字符串.连接(牌记录,"K")
            endif
        endfor
        牌记录 = 字符串.连接(牌记录,"\r\n")
        
        for(j=0;j<8;j++)
            if(tile[88+j] != 0)    
                牌记录 = 字符串.连接(牌记录,"A")
            endif
        endfor
        牌记录 = 字符串.连接(牌记录,"\r\n")   
        
        for(j=0;j<8;j++)
            if(tile[96+j] != 0)    
                牌记录 = 字符串.连接(牌记录,"2")
            endif
        endfor
        牌记录 = 字符串.连接(牌记录,"\r\n")            
        
        if (tile[104] != 0)
            牌记录 = 字符串.连接(牌记录,"小")
        endif
        if (tile[105] != 0)
            牌记录 = 字符串.连接(牌记录,"小")
        endif
        牌记录 = 字符串.连接(牌记录,"\r\n")
        if (tile[106] != 0)
            牌记录 = 字符串.连接(牌记录,"大")
        endif
        if (tile[107] != 0)
            牌记录 = 字符串.连接(牌记录,"大")
        endif
        牌记录 = 字符串.连接(牌记录,"\r\n")
        编辑框.设置文本("剩余牌",牌记录) 
    endif
    上一次总牌数 = 总牌数
    
    
功能结束

功能 线程开始()
    
    
    己本次剩余牌数 = 进程.读byte(双扣窗口进程句柄,己牌数基址)
    辅助.等待(50)
    右本次剩余牌数 = 进程.读byte(双扣窗口进程句柄,右牌数基址)
    辅助.等待(50)
    中本次剩余牌数 = 进程.读byte(双扣窗口进程句柄,中牌数基址)
    辅助.等待(50)
    左本次剩余牌数 = 进程.读byte(双扣窗口进程句柄,左牌数基址)
    辅助.等待(50)
    
    双扣记牌器.游戏开始()
    //总牌数 = 己本次剩余牌数+右本次剩余牌数+中本次剩余牌数+左本次剩余牌数
    
    while(true)
        双扣记牌器.读己出牌()
        双扣记牌器.读右出牌()
        双扣记牌器.读中出牌()
        双扣记牌器.读左出牌()
        双扣记牌器.游戏开始()
        辅助.等待(500)
    endwhile
    
功能结束

功能 判断出牌(出牌数,出牌型,出牌张)
    出牌记录 = ""
    ind = 出牌张-3
    选择(出牌型)
        条件 1:
        出牌记录 = 字符串.连接(出牌记录,类型.转字符型(出牌张))
        if(ind==50)
            if(tile[104]!=0)
                tile[104]=0
            else
                tile[105]=0
            endif
        else 
            if (ind==51)
                if(tile[106]!=0)
                    tile[106]=0
                else
                    tile[107]=0
                endif
            else
                for(j=0;j<8;j++)
                    if(tile[8*ind+j]!=0)
                        tile[8*ind+j]=0
                        break
                    endif
                endfor
            endif
        endif
        
        条件 2:
        for(i=0;i<2;i++)
            出牌记录 = 字符串.连接(出牌记录,类型.转字符型(出牌张))
        endfor
        if(ind==50)
            tile[104]=0
            tile[105]=0
        else 
            if (ind==51)
                tile[106]=0
                tile[107]=0
            else
                for(j=0;j<7;j++)
                    if(tile[8*ind+j]!=0)
                        tile[8*ind+j]=0
                        tile[8*ind+j+1]=0
                        break
                    endif
                endfor
            endif
        endif
        
        条件 3:
        for(i=0;i<3;i++)
            出牌记录 = 字符串.连接(出牌记录,类型.转字符型(出牌张))
        endfor
        for(j=0;j<6;j++)
            if(tile[8*ind+j]!=0)
                tile[8*ind+j]=0
                tile[8*ind+j+1]=0
                tile[8*ind+j+2]=0
                break
            endif
        endfor
        
        条件 4:
        for(i=0;i<出牌数/2;i++)
            出牌记录 = 字符串.连接(出牌记录,类型.转字符型(出牌张+i))
            出牌记录 = 字符串.连接(出牌记录,类型.转字符型(出牌张+i))
        endfor
        for(i=0;i<出牌数/2;i++)
            for(j=0;j<7;j++)
                if(tile[8*(ind+i)+j]!=0)
                    tile[8*(ind+i)+j]=0
                    tile[8*(ind+i)+j+1]=0
                    break
                endif
            endfor
        endfor
        
        条件 5:
        for(i=0;i<出牌数/3;i++)
            出牌记录 = 字符串.连接(出牌记录,类型.转字符型(出牌张+i))
            出牌记录 = 字符串.连接(出牌记录,类型.转字符型(出牌张+i))
            出牌记录 = 字符串.连接(出牌记录,类型.转字符型(出牌张+i))
        endfor
        for(i=0;i<出牌数/3;i++)
            for(j=0;j<6;j++)
                if(tile[8*(ind+i)+j]!=0)
                    tile[8*(ind+i)+j]=0
                    tile[8*(ind+i)+j+1]=0
                    tile[8*(ind+i)+j+2]=0
                    break
                endif
            endfor
        endfor
        
        条件 6:
        for(i=0;i<出牌数;i++)
            出牌记录 = 字符串.连接(出牌记录,类型.转字符型(出牌张+i))
        endfor
        for(i=0;i<出牌数;i++)
            for(j=0;j<8;j++)
                if(tile[8*(ind+i)+j]!=0)
                    tile[8*(ind+i)+j]=0
                    break
                endif
            endfor
        endfor
        
        条件 7:
        for(i=0;i<出牌数;i++)
            出牌记录 = 字符串.连接(出牌记录,类型.转字符型(出牌张))
        endfor
        for(j=0;j<9-出牌数;j++)
            if(tile[8*ind+j]!=0)
                for(i=0;i<出牌数;i++)
                    tile[8*ind+i+j]=0
                endfor
                break
            endif
        endfor
    选择结束
    
    出牌记录 = 字符串.连接(出牌记录,"; ")
    return 出牌记录
功能结束


功能 读己出牌()
    
    //己基址 = 己牌数基址 + #28
    
    整型 出牌数,出牌型,出牌张
    
    己上一次剩余牌数 = 己本次剩余牌数
    
    己本次剩余牌数 = 进程.读byte(双扣窗口进程句柄,己牌数基址)
    
    己循环 = 己上一次剩余牌数 - 己本次剩余牌数
    //上一次剩余牌数 = 本次剩余牌数 
    if(己循环 > 0)
        //偏移 = 偏移 + #8 * (循环控制 - 1)
        出牌数 = 进程.读byte(双扣窗口进程句柄,己基址 -  #8)
        出牌型 = 进程.读byte(双扣窗口进程句柄,己基址 -  #4)
        出牌张 = 进程.读byte(双扣窗口进程句柄,己基址)
        if (出牌数 >0)
            
            出牌记录=双扣记牌器.判断出牌(出牌数,出牌型,出牌张)
            己2记录 = 字符串.连接(己2记录,出牌记录)
            编辑框.设置文本("己2出牌框",己2记录) 
        endif
    endif
    如果(己上一次剩余牌数 == 0)
        己2记录 = ""
    如果结束
    //上一次剩余牌数 = 本次剩余牌数
    //上一次剩余牌数 = 本次剩余牌数
    
功能结束

功能 读右出牌()
    
    //右牌数基址 = 己牌数基址 + #B8
    //右基址 = 右牌数基址 + #28
    
    整型 出牌数,出牌型,出牌张
    
    右上一次剩余牌数 = 右本次剩余牌数
    右本次剩余牌数 = 进程.读byte(双扣窗口进程句柄,右牌数基址)
    
    右循环 = 右上一次剩余牌数 - 右本次剩余牌数
    //上一次剩余牌数 = 本次剩余牌数 
    if(右循环 > 0)
        //偏移 = 偏移 + #8 * (循环控制 - 1)
        出牌数 = 进程.读byte(双扣窗口进程句柄,右基址 -  #8)
        出牌型 = 进程.读byte(双扣窗口进程句柄,右基址 -  #4)
        出牌张 = 进程.读byte(双扣窗口进程句柄,右基址)
        if (出牌数 >0)
            出牌记录=双扣记牌器.判断出牌(出牌数,出牌型,出牌张)  
            右2记录 = 字符串.连接(右2记录,出牌记录)
            编辑框.设置文本("右2出牌框",右2记录)
        endif
    endif
    如果(右上一次剩余牌数 == 0)
        右2记录 = ""
    如果结束
    //上一次剩余牌数 = 本次剩余牌数
    //上一次剩余牌数 = 本次剩余牌数
    
功能结束

功能 读中出牌()
    
    //中牌数基址 = 右牌数基址 + #B8
    //中基址 = 中牌数基址 + #28
    
    整型 出牌数,出牌型,出牌张
    
    中上一次剩余牌数 = 中本次剩余牌数
    中本次剩余牌数 = 进程.读byte(双扣窗口进程句柄,中牌数基址)
    
    中循环 = 中上一次剩余牌数 - 中本次剩余牌数
    //上一次剩余牌数 = 本次剩余牌数 
    if(中循环 > 0)
        //偏移 = 偏移 + #8 * (循环控制 - 1)
        出牌数 = 进程.读byte(双扣窗口进程句柄,中基址 -  #8)
        出牌型 = 进程.读byte(双扣窗口进程句柄,中基址 -  #4)
        出牌张 = 进程.读byte(双扣窗口进程句柄,中基址)
        if (出牌数 >0)
            出牌记录=双扣记牌器.判断出牌(出牌数,出牌型,出牌张)    
            中2记录 = 字符串.连接(中2记录,出牌记录)
            编辑框.设置文本("中2出牌框",中2记录)
        endif
    endif
    如果(中上一次剩余牌数 == 0)
        中2记录 = ""
    如果结束
    //上一次剩余牌数 = 本次剩余牌数
    
功能结束

功能 读左出牌()
    
    //左牌数基址 = 中牌数基址 + #B8
    //左基址 = 左牌数基址 + #28
    
    整型 出牌数,出牌型,出牌张
    
    左上一次剩余牌数 = 左本次剩余牌数
    
    左本次剩余牌数 = 进程.读byte(双扣窗口进程句柄,左牌数基址)
    
    左循环 = 左上一次剩余牌数 - 左本次剩余牌数
    //上一次剩余牌数 = 本次剩余牌数 
    if(左循环 > 0)
        //偏移 = 偏移 + #8 * (循环控制 - 1)
        出牌数 = 进程.读byte(双扣窗口进程句柄,左基址 -  #8)
        出牌型 = 进程.读byte(双扣窗口进程句柄,左基址 -  #4)
        出牌张 = 进程.读byte(双扣窗口进程句柄,左基址)
        if (出牌数 >0)
            出牌记录=双扣记牌器.判断出牌(出牌数,出牌型,出牌张)
            左2记录 = 字符串.连接(左2记录,出牌记录)
            编辑框.设置文本("左2出牌框",左2记录)
        endif
    endif
    如果(左上一次剩余牌数 == 0)
        左2记录 = ""
    如果结束
    //上一次剩余牌数 = 本次剩余牌数
    
功能结束

//退出按钮_点击操作
功能 退出_点击()
    线程.关闭(线程句柄,0)
    辅助.退出()
功能结束


功能 初始化()
    //这里添加你要执行的代码
    
功能结束

空间结束
//空间结束语句