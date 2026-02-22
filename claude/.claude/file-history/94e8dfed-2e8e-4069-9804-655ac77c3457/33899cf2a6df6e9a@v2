# 修复WindowSnap设置窗口问题

## 问题描述
1. 设置界面中，拖动滑块时百分比的文字部分不会实时变化
2. 点击保存时应用会崩溃

## 问题分析结果

### 问题1：标签不实时更新
**原因**：标签文本只在窗口创建时设置：
```swift
let xLabel = NSTextField(labelWithString: "横坐标百分比 (\(Int(config.xPercent * 100))%):")
```
滑块移动时没有更新标签的机制。

### 问题2：保存时崩溃的可能原因
1. **递归保存问题**：`config`的`didSet`观察者中调用`ConfigManager.shared.save(config)`，而保存按钮的`saveSettings`方法也调用`ConfigManager.shared.save(config)`，可能导致递归。
2. **配置管理器问题**：`ConfigManager`的文件写入可能存在权限问题或异常。
3. **窗口实例为nil**：`windowSnap?.updateConfig(config)`中的`windowSnap`可能为`nil`。
4. **线程问题**：滑块回调在主线程，但保存可能涉及文件I/O。

## 关键文件位置
- `/Users/jwfeng/Downloads/for_claude/WindowSnap/Sources/main.swift`：所有相关代码

## 需要修改的部分

### 1. 修复标签实时更新
- 将标签定义为类属性以便访问
- 在滑块回调中更新标签文本
- 添加辅助方法更新所有标签

### 2. 修复崩溃问题
- 移除`config`的`didSet`中的自动保存，避免递归
- 在`saveSettings`中统一保存
- 添加错误处理
- 确保`windowSnap`不为nil

### 3. 改进配置管理
- 验证滑块回调中的sender有效性
- 添加文件写入错误处理
- 确保线程安全

## 实施计划
1. 重构`createSettingsWindow`，将UI元素存储为实例变量
2. 修改滑块回调方法，同时更新标签文本
3. 重构`config`的`didSet`观察者，移除自动保存
4. 增强`saveSettings`方法的错误处理
5. 添加调试日志帮助诊断问题