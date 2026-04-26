# SOP Batch Generator

SOP 批量生成器 — 将标准作业程序（SOP）文件夹结构批量导出为视频和图片资产。

## 功能

- 选择 SOP 输入根目录，按文件夹层级自动生成标题
- 支持上传 Logo、标记图片和字体
- 可调整预览布局和图层位置
- 批量导出视频和图片
- 内置 FFmpeg，无需额外安装

## 文件夹规则

- SOP 根目录下的**第一层文件夹**名称作为**大标题**
- **第二层文件夹**名称作为**中标题**
- 视频和图片均可作为任务导出

## 安装

1. 从 [Releases](https://github.com/wuxizhouzequn/SOP-Tools/releases) 下载
2. 运行 `install.ps1`（PowerShell）：
   ```powershell
   powershell -ExecutionPolicy Bypass -File install.ps1
   ```
3. 桌面会自动创建快捷方式

## 卸载

运行 `uninstall.ps1` 即可卸载。

## 数据存储

资产和历史记录保存在：
```
%APPDATA%\sop_renderer
```
