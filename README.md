# rime-pinin

## 克隆

正常分步执行：

```powershell
git clone git@github.com:asnekaa/rime-pinin.git
cd rime-pinin
.\others\setup.ps1
```

也可以直接一次执行：

```powershell
git clone git@github.com:asnekaa/rime-pinin.git; if ($?) { cd rime-pinin; .\others\setup.ps1 }
```

`setup.ps1` 会初始化 `rime-ice`、`rime-kagiroi`、`rime-wanxiang-data` 三个子模块，并根据 `others/*-sparse.txt` 中的路径列表，只保留各子模块中需要的文件

## 子模块更新

当上游子模块仓库有更新时，可以在主仓库根目录执行以下命令。

### 更新所有子模块

```powershell
git submodule update --init --remote --recursive
```

该命令会获取子模块远程分支的最新提交，而不是仅使用主仓库记录的提交。

### 重新应用文件筛选

更新子模块后，重新执行：

```powershell
.\others\setup.ps1
```

脚本会根据 `others/*-sparse.txt` 中的路径列表，重新处理 `rime-ice`、`rime-kagiroi` 和 `rime-wanxiang-data`，保留需要的文件。
