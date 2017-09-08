# SKFUIbuttoncategory

#### 前几天在写项目的时候，有两个需求，一个是一个按钮不能在短时间内重复点击，另一个需求是扩大按钮的点击区域,利用 Runtime 实现了这两个需求

####使用很简单，导入项目中的两个 UIButton 的 Category。

####1，增加按钮点击间隔时间

```objc
 self.yourButton.acceptEventInterval=5;
```




#### 2，扩大按钮点击区域
```objc
[self.yourButton setEnlargeEdgeWithTop:30 right:30 bottom:30 left:30];
```