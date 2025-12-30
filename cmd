排产原则
1.        原料或者中间体是OEB4的项目，天津需要安排单独反应间  ，尽量使用三合一

2.        高压反应，闷罐反应，加活性炭，钯碳，需要安排高压釜和后处理釜  。绍兴工厂尽量不排产硅胶进釜的项目，如必须要进釜使用，例如硅胶/分子筛/硅藻土/活性炭专需要使用专用釜  。

对于603车间：Bay1-4，5-8，9-12，13-16，17-20是连接的区域。


排产总原则
1.        同一项目尽量安排在同一Bay区内，辅助设备同样（若无特殊要求）  
2.        无特殊情况，有PO的项目优先，无特殊情况，洁净区   先准备好的项目先进
3.        若涉及三合一低温烘料需安排特殊三合一（602无）；605加氢车间溶解釜与高压釜只能排同一Bay区内的  
4.        离心和烘干的同时，若反应釜还继续用于下一步骤或者批次生产，反应釜是空置等待离心和烘干结束  
5.        低闪点溶剂尽量避免装桶
先判断釜对应的卧刮有没有空着，如果没有卧刮，再去判断是否有可用的平板
多步的批次尽量用同一套设备链，
尽量项目的多个合成步骤在一套设备干下来，尽量一个车间

流程与规则：
输入：按合成步骤（带项目信息），批次数目，+本合成步骤的详细需求作为一次输入时候,






Cryogenic 低温
Ht Reactor 高温
Reactor 普通


CREATE TABLE aps.equipment (
        equipment_id serial4 NOT NULL,
        equipment_no varchar(50) NOT NULL,  -- 设备代码
        equipment_name varchar(100) NOT NULL, --设备名称
        equipment_size varchar(50) NULL, -- 设备大小
        function_category varchar(50) NULL,--- 工艺分类 标志是反应釜  还是离心 ，还是干燥等
        plant_area varchar(20) NULL,  -- 所在厂
        workshop varchar(20) NULL,  --所在车间
        equipment_location varchar(100) NULL, -- 设备位置 暂时没用到
        "zone" varchar(20) NULL,--区域 一般1 2 3 4 这样的四个bay组成一个区域，管道相连 可以共用过滤 离心，干燥设备
        bay varchar(20) NULL,-- 尽量用一个bay的设备生产，不行尽量用一个区域，再不行尽量用一个车间生产
        gmp varchar(20) NULL,


        movable bool DEFAULT false NOT NULL,---是否可以移动
        usable int4 DEFAULT 1 NOT NULL,  -- 设备是否可用
        description text NULL,
        created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
        updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
        texture bpchar(20) NULL,   --- 材质
        cleanspace bool DEFAULT false NOT NULL, -- 清洗间标志
        bergmeal bool DEFAULT false NOT NULL,  -- 是否是硅藻土等专用设备
        temp_level int4 DEFAULT 1 NULL, -- 温度条件 高温，低温 ，对应页面上的温度
        hydrogenate_flow int4 NULL,  --- 设备是氢化还是流体，氢化是1，流体是2
);
用timefold，jpa 写按步骤的批次排到设备的程序
