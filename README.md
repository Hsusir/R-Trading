# R-Trading
用R分析台積電股票與交易策略

時間週期
 ‧日K:Default
 ‧週K:STK_week=to.weekly(STK)
 ‧月K:STK_mon=to.monthly(STK)
 ‧自行定義? 週三K
時間範圍
 ‧STK["2013"]
 ‧to.weekly(STK["2013::2015"])
 ‧STK["2013-01-01::2013-03-02"]
畫圖(Charting)
 ‧barChart(STK["2015-01-01::2015-02-03"])
 ‧chartSeries(STK, subset="2015-12-1::2016-03-21",theme="white")
