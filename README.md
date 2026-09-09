# Rime

## 克隆

正常分步执行：

```powershell
git clone --recurse-submodules git@github.com:asnekaa/Rime.git
cd Rime
.\others\setup.ps1
```

也可以直接一次执行：

```powershell
git clone --recurse-submodules git@github.com:asnekaa/Rime.git; if ($?) { cd Rime; .\others\setup.ps1 }
```

执行完即可使用。

`setup.ps1` 会初始化 `rime-ice`、`rime-kagiroi`，并按照 `others/` 中的 sparse-checkout 配置只保留需要的文件。
