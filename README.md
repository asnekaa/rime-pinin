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

---

# Pinin
## 完整音节表

<table>
<thead>
<tr>
  <th rowspan="2" align="center">声母</th>
  <th rowspan="2" align="center">介母</th>
  <th align="center">韵母</th>
  <th colspan="3" align="center">单韵母</th>
  <th colspan="4" align="center">复韵母</th>
  <th colspan="4" align="center">鼻韵母</th>
</tr>
<tr>
  <th align="center">/</th>
  <th align="center">a</th>
  <th align="center">o</th>
  <th align="center">e</th>
  <th align="center">ai</th>
  <th align="center">ei</th>
  <th align="center">ao</th>
  <th align="center">ou</th>
  <th align="center">w</th>
  <th align="center">v</th>
  <th align="center">ñ</th>
  <th align="center">ŋ</th>
</tr>
</thead>
<tbody>
<tr>
  <td rowspan="4" align="center">/</td>
  <td align="center">/</td>
  <td align="center">ar/er</td>
  <td align="center">a</td>
  <td align="center">o</td>
  <td align="center">e</td>
  <td align="center">ai</td>
  <td align="center">ei</td>
  <td align="center">ao</td>
  <td align="center">ou</td>
  <td align="center">w</td>
  <td align="center">v</td>
  <td align="center">ñ</td>
  <td align="center">ŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">i</td>
  <td align="center">ia</td>
  <td align="center"></td>
  <td align="center">ie</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">io</td>
  <td align="center">iu</td>
  <td align="center">iw</td>
  <td align="center">iv</td>
  <td align="center">iñ</td>
  <td align="center">iŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">u</td>
  <td align="center">ua</td>
  <td align="center">uo</td>
  <td align="center"></td>
  <td align="center">ui</td>
  <td align="center">ue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">uw</td>
  <td align="center">uv</td>
  <td align="center">uñ</td>
  <td align="center">uŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center">yo</td>
  <td align="center">ye</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">yw</td>
  <td align="center"></td>
  <td align="center">yñ</td>
  <td align="center">yŋ</td>
</tr>
<tr>
  <td rowspan="4" align="center">b</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">ba</td>
  <td align="center">bo</td>
  <td align="center"></td>
  <td align="center">bai</td>
  <td align="center">bei</td>
  <td align="center">bao</td>
  <td align="center"></td>
  <td align="center">bw</td>
  <td align="center">bv</td>
  <td align="center">bñ</td>
  <td align="center">bŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">bi</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">bie</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">bio</td>
  <td align="center"></td>
  <td align="center">biw</td>
  <td align="center">biv</td>
  <td align="center">biñ</td>
  <td align="center">biŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">bu</td>
  <td align="center"></td>
  <td align="center">buo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">buŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">p</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">pa</td>
  <td align="center">po</td>
  <td align="center"></td>
  <td align="center">pai</td>
  <td align="center">pei</td>
  <td align="center">pao</td>
  <td align="center"></td>
  <td align="center">pw</td>
  <td align="center">pv</td>
  <td align="center">pñ</td>
  <td align="center">pŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">pi</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">pie</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">pio</td>
  <td align="center"></td>
  <td align="center">piw</td>
  <td align="center"></td>
  <td align="center">piñ</td>
  <td align="center">piŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">pu</td>
  <td align="center"></td>
  <td align="center">puo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">puŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">m</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">ma</td>
  <td align="center">mo</td>
  <td align="center"></td>
  <td align="center">mai</td>
  <td align="center">mei</td>
  <td align="center">mao</td>
  <td align="center">mou</td>
  <td align="center">mw</td>
  <td align="center">mv</td>
  <td align="center">mñ</td>
  <td align="center">mŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">mi</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">mie</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">mio</td>
  <td align="center"></td>
  <td align="center">miw</td>
  <td align="center"></td>
  <td align="center">miñ</td>
  <td align="center">miŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">mu</td>
  <td align="center"></td>
  <td align="center">muo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">muŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">f</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">fa</td>
  <td align="center">fo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">fei</td>
  <td align="center"></td>
  <td align="center">fou</td>
  <td align="center">fw</td>
  <td align="center">fv</td>
  <td align="center">fñ</td>
  <td align="center">fŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">fio</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">fu</td>
  <td align="center"></td>
  <td align="center">fuo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">fuŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">d</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">da</td>
  <td align="center">do</td>
  <td align="center">de</td>
  <td align="center">dai</td>
  <td align="center">dei</td>
  <td align="center">dao</td>
  <td align="center">dou</td>
  <td align="center">dw</td>
  <td align="center">dv</td>
  <td align="center">dñ</td>
  <td align="center">dŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">di</td>
  <td align="center">dia</td>
  <td align="center"></td>
  <td align="center">die</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">dio</td>
  <td align="center">diu</td>
  <td align="center">diw</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">diŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">du</td>
  <td align="center"></td>
  <td align="center">duo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">due</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">duw</td>
  <td align="center">duv</td>
  <td align="center">duñ</td>
  <td align="center">duŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">t</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">ta</td>
  <td align="center">to</td>
  <td align="center">te</td>
  <td align="center">tai</td>
  <td align="center">tei</td>
  <td align="center">tao</td>
  <td align="center">tou</td>
  <td align="center">tw</td>
  <td align="center">tv</td>
  <td align="center"></td>
  <td align="center">tŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">ti</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">tie</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">tio</td>
  <td align="center"></td>
  <td align="center">tiw</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">tiŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">tu</td>
  <td align="center"></td>
  <td align="center">tuo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">tue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">tuw</td>
  <td align="center"></td>
  <td align="center">tuñ</td>
  <td align="center">tuŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">n</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">na</td>
  <td align="center">no</td>
  <td align="center">ne</td>
  <td align="center">nai</td>
  <td align="center">nei</td>
  <td align="center">nao</td>
  <td align="center">nou</td>
  <td align="center">nw</td>
  <td align="center">nv</td>
  <td align="center">nñ</td>
  <td align="center">nŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">ni</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">nie</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">nio</td>
  <td align="center">niu</td>
  <td align="center">niw</td>
  <td align="center">niv</td>
  <td align="center">niñ</td>
  <td align="center">niŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">nu</td>
  <td align="center"></td>
  <td align="center">nuo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">nuw</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">nuŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center">ny</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">nye</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">l</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">la</td>
  <td align="center">lo</td>
  <td align="center">le</td>
  <td align="center">lai</td>
  <td align="center">lei</td>
  <td align="center">lao</td>
  <td align="center">lou</td>
  <td align="center">lw</td>
  <td align="center">lv</td>
  <td align="center"></td>
  <td align="center">lŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">li</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">lie</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">lio</td>
  <td align="center">liu</td>
  <td align="center">liw</td>
  <td align="center">liv</td>
  <td align="center">lñ</td>
  <td align="center">liŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">lu</td>
  <td align="center"></td>
  <td align="center">luo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">luw</td>
  <td align="center"></td>
  <td align="center">luñ</td>
  <td align="center">luŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center">ly</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">lye</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">g</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">ga</td>
  <td align="center">go</td>
  <td align="center">ge</td>
  <td align="center">gai</td>
  <td align="center">gei</td>
  <td align="center">gao</td>
  <td align="center">gou</td>
  <td align="center">gw</td>
  <td align="center">gv</td>
  <td align="center">gñ</td>
  <td align="center">gŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">gu</td>
  <td align="center">gua</td>
  <td align="center">guo</td>
  <td align="center"></td>
  <td align="center">gui</td>
  <td align="center">gue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">guw</td>
  <td align="center">guv</td>
  <td align="center">guñ</td>
  <td align="center">guŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">k</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">ka</td>
  <td align="center">ko</td>
  <td align="center">ke</td>
  <td align="center">kai</td>
  <td align="center">kei</td>
  <td align="center">kao</td>
  <td align="center">kou</td>
  <td align="center">kw</td>
  <td align="center">kv</td>
  <td align="center">kñ</td>
  <td align="center">kŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">ku</td>
  <td align="center">kua</td>
  <td align="center">kuo</td>
  <td align="center"></td>
  <td align="center">kui</td>
  <td align="center">kue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">kuw</td>
  <td align="center">kuv</td>
  <td align="center">kuñ</td>
  <td align="center">kuŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">h</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center">ha</td>
  <td align="center">ho</td>
  <td align="center">he</td>
  <td align="center">hai</td>
  <td align="center">hei</td>
  <td align="center">hao</td>
  <td align="center">hou</td>
  <td align="center">hw</td>
  <td align="center">hv</td>
  <td align="center">hñ</td>
  <td align="center">hŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">hu</td>
  <td align="center">hua</td>
  <td align="center">huo</td>
  <td align="center"></td>
  <td align="center">hui</td>
  <td align="center">hue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">huw</td>
  <td align="center">huv</td>
  <td align="center">huñ</td>
  <td align="center">huŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">j</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">ji</td>
  <td align="center">jia</td>
  <td align="center"></td>
  <td align="center">jie</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">jio</td>
  <td align="center">jiu</td>
  <td align="center">jiw</td>
  <td align="center">jiv</td>
  <td align="center">jiñ</td>
  <td align="center">jiŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center">jy</td>
  <td align="center"></td>
  <td align="center">jyo</td>
  <td align="center">jye</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">jyw</td>
  <td align="center"></td>
  <td align="center">jyñ</td>
  <td align="center">jyŋ</td>
</tr>
<tr>
  <td rowspan="4" align="center">q</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">qi</td>
  <td align="center">qia</td>
  <td align="center"></td>
  <td align="center">qie</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">qio</td>
  <td align="center">qiu</td>
  <td align="center">qiw</td>
  <td align="center">qiv</td>
  <td align="center">qiñ</td>
  <td align="center">qiŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center">qy</td>
  <td align="center"></td>
  <td align="center">qyo</td>
  <td align="center">qye</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">qyw</td>
  <td align="center"></td>
  <td align="center">qyñ</td>
  <td align="center">qyŋ</td>
</tr>
<tr>
  <td rowspan="4" align="center">x</td>
  <td align="center">/</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center">xi</td>
  <td align="center">xia</td>
  <td align="center"></td>
  <td align="center">xie</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">xio</td>
  <td align="center">xiu</td>
  <td align="center">xiw</td>
  <td align="center">xiv</td>
  <td align="center">xiñ</td>
  <td align="center">xiŋ</td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center">xy</td>
  <td align="center"></td>
  <td align="center">xyo</td>
  <td align="center">xye</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">xyw</td>
  <td align="center"></td>
  <td align="center">xyñ</td>
  <td align="center">xyŋ</td>
</tr>
<tr>
  <td rowspan="4" align="center">z</td>
  <td align="center">/</td>
  <td align="center">z</td>
  <td align="center">za</td>
  <td align="center">zo</td>
  <td align="center">ze</td>
  <td align="center">zai</td>
  <td align="center">zei</td>
  <td align="center">zao</td>
  <td align="center">zou</td>
  <td align="center">zw</td>
  <td align="center">zv</td>
  <td align="center">zñ</td>
  <td align="center">zŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">zu</td>
  <td align="center"></td>
  <td align="center">zuo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">zue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">zuw</td>
  <td align="center"></td>
  <td align="center">zuñ</td>
  <td align="center">zuŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">c</td>
  <td align="center">/</td>
  <td align="center">c</td>
  <td align="center">ca</td>
  <td align="center">co</td>
  <td align="center">ce</td>
  <td align="center">cai</td>
  <td align="center">cei</td>
  <td align="center">cao</td>
  <td align="center">cou</td>
  <td align="center">cw</td>
  <td align="center">cv</td>
  <td align="center">cñ</td>
  <td align="center">cŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">cu</td>
  <td align="center"></td>
  <td align="center">cuo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">cue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">cuw</td>
  <td align="center"></td>
  <td align="center">cuñ</td>
  <td align="center">cuŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">s</td>
  <td align="center">/</td>
  <td align="center">s</td>
  <td align="center">sa</td>
  <td align="center">so</td>
  <td align="center">se</td>
  <td align="center">sai</td>
  <td align="center">sei</td>
  <td align="center">sao</td>
  <td align="center">sou</td>
  <td align="center">sw</td>
  <td align="center">sv</td>
  <td align="center">sñ</td>
  <td align="center">sŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">su</td>
  <td align="center"></td>
  <td align="center">suo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">sue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">suw</td>
  <td align="center"></td>
  <td align="center">suñ</td>
  <td align="center">suŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">ẑ</td>
  <td align="center">/</td>
  <td align="center">ẑ</td>
  <td align="center">ẑa</td>
  <td align="center">ẑo</td>
  <td align="center">ẑe</td>
  <td align="center">ẑai</td>
  <td align="center">ẑei</td>
  <td align="center">ẑao</td>
  <td align="center">ẑou</td>
  <td align="center">ẑw</td>
  <td align="center">ẑv</td>
  <td align="center">ẑñ</td>
  <td align="center">ẑŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">ẑu</td>
  <td align="center">ẑua</td>
  <td align="center">ẑuo</td>
  <td align="center"></td>
  <td align="center">ẑui</td>
  <td align="center">ẑue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">ẑuw</td>
  <td align="center">ẑuv</td>
  <td align="center">ẑuñ</td>
  <td align="center">ẑuŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">ĉ</td>
  <td align="center">/</td>
  <td align="center">ĉ</td>
  <td align="center">ĉa</td>
  <td align="center">ĉo</td>
  <td align="center">ĉe</td>
  <td align="center">ĉai</td>
  <td align="center"></td>
  <td align="center">ĉao</td>
  <td align="center">ĉou</td>
  <td align="center">ĉw</td>
  <td align="center">ĉv</td>
  <td align="center">ĉñ</td>
  <td align="center">ĉŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">ĉu</td>
  <td align="center"></td>
  <td align="center">ĉuo</td>
  <td align="center">ĉua</td>
  <td align="center">ĉui</td>
  <td align="center">ĉue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">ĉuw</td>
  <td align="center">ĉuv</td>
  <td align="center">ĉuñ</td>
  <td align="center">ĉuŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">ŝ</td>
  <td align="center">/</td>
  <td align="center">ŝ</td>
  <td align="center">ŝa</td>
  <td align="center">ŝo</td>
  <td align="center">ŝe</td>
  <td align="center">ŝai</td>
  <td align="center">ŝei</td>
  <td align="center">ŝao</td>
  <td align="center">ŝou</td>
  <td align="center">ŝw</td>
  <td align="center">ŝv</td>
  <td align="center">ŝñ</td>
  <td align="center">ŝŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">ŝu</td>
  <td align="center">ŝua</td>
  <td align="center">ŝuo</td>
  <td align="center"></td>
  <td align="center">ŝui</td>
  <td align="center">ŝue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">ŝuw</td>
  <td align="center">ŝuv</td>
  <td align="center">ŝuñ</td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td rowspan="4" align="center">r</td>
  <td align="center">/</td>
  <td align="center">r</td>
  <td align="center"></td>
  <td align="center">ro</td>
  <td align="center">re</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">rao</td>
  <td align="center">rou</td>
  <td align="center">rw</td>
  <td align="center">rv</td>
  <td align="center">rñ</td>
  <td align="center">rŋ</td>
</tr>
<tr>
  <td align="center">i</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
<tr>
  <td align="center">u</td>
  <td align="center">ru</td>
  <td align="center">rua</td>
  <td align="center">ruo</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">rue</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center">ruw</td>
  <td align="center">ruv</td>
  <td align="center">ruñ</td>
  <td align="center">ruŋ</td>
</tr>
<tr>
  <td align="center">y</td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
  <td align="center"></td>
</tr>
</tbody>
</table>
