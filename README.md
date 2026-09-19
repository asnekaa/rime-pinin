# Rime

## 克隆

正常分步执行：

```powershell
git clone git@github.com:asnekaa/Rime.git
cd Rime
.\others\setup.ps1
```

也可以直接一次执行：

```powershell
git clone git@github.com:asnekaa/Rime.git; if ($?) { cd Rime; .\others\setup.ps1 }
```

`setup.ps1` 会初始化 `rime-ice`、`rime-kagiroi`、`RIME-LMDG` 三个子模块，并根据 `others/*-sparse.txt` 中的路径列表，只保留各子模块中需要的文件

执行完后重新部署即可使用。
