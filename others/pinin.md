# Pinin

> 体系：**声母 + 介母 + 韵母**（可任意组合，但遵循实际拼音习惯）  
> 每个音素只有一个身份。声调写在编码末尾。  
> 顺序：声母 → 介母 → 韵母。

---

## 一、基本元素（按顺序）

### 声母（21个）
`b p m f d t n l g k h j q x z c s r`

### 介母（3个）
`i u y`

### 韵母
- **单韵母**：`a o e`
- **复韵母**：`ai ei ao ou`
- **鼻韵母**：`w v n g`

### 特殊音节
- `ar` / `er`  
  不能与声母、介母组合，单独使用。

---

## 二、声调符号

| 声调 | 符号 | 示例 |
|---|---|---|
| 一声 | `－` | `mā` → `ma－` |
| 二声 | `／` | `má` → `ma／` |
| 三声 | `｜` | `mǎ` → `ma｜` |
| 四声 | `＼` | `mà` → `ma＼` |
| 轻声 | `・` | `ma` → `ma・` |

声调符号加在压缩后的编码末尾。

---

## 三、变种符号（仅用于自定义短语）

- `＿` 和 `￣` 表示同一编码的不同变种。
- 例：
  - `z` = 字，`z＿` = 在，`z￣` = 再
  - `t` = 他，`t＿` = 她，`t￣` = 它

---

## 四、声母改写

| 标准声母 | 输入码 |
|---|---|
| `b p m f d t n l g k h` | 不变 |
| `j q x` | 不变 |
| `zh` | `j` |
| `ch` | `q` |
| `sh` | `x` |
| `z c s r` | 不变 |

空韵：

| 标准 | 输入 |
|---|---|
| `zhi` | `j` |
| `chi` | `q` |
| `shi` | `x` |
| `zi` | `z` |
| `ci` | `c` |
| `si` | `s` |
| `ri` | `r` |

---

## 五、介母与韵母组合

标准拼音中的许多韵母是 **介母 + 韵母** 的组合或简写。  
自创编码中，韵母只保留：`a o e`、`ai ei ao ou`、`w v n g`。

### 1. 介母 `i` 的组合

| 标准 | 组合 | 输入码 |
|---|---|---|
| `ia` | `i + a` | `ia` |
| `ie` | `i + e` | `ie` |
| `iao` | `i + ao` | `io` |
| `iu` | `i + ou` | `iu` |
| `ian` | `i + an` → `i + w` | `iw` |
| `iang` | `i + ang` → `i + v` | `iv` |
| `in` | `i + n` | `in` |
| `ing` | `i + ng` → `i + g` | `ig`（额外编码 `in`） |

> 注意：`iong` 的介母是 `y`，不在此处，见介母 `y` 的组合。

### 2. 介母 `u` 的组合

| 标准 | 组合 | 输入码 |
|---|---|---|
| `ua` | `u + a` | `ua` |
| `uo` | `u + o` | `o`（额外编码 `uo`） |
| `uai` | `u + ai` | `ui` |
| `ui` | `u + ei` | `ue` |
| `uan` | `u + an` → `u + w` | `uw` |
| `uang` | `u + ang` → `u + v` | `uv` |
| `ueng` | `u + eng` → `u + g` | `ug` |
| `un` | `u + en` → `u + n` | `un` |
| `ong` | `u + g` | `ug` |

### 3. 介母 `y` 的组合（`ü` 最终写作 `y`）

| 标准 | 输入码 |
|---|---|
| `ü` | `y` |
| `üe` | `ye` |
| `üan` | `yw` |
| `ün` | `yn` |
| `iong` | `yg` |
| `yong` | `yg` |
| `ü` 与 `j/q/x` 组合 | `j/q/x + y`，如 `ju → jy`、`jue → jye`、`juan → jyw`、`jun → jyn`、`jiong → jyg` |

### 4. 鼻韵母改写

| 标准 | 输入码 |
|---|---|
| `an` | `w` |
| `ang` | `v` |
| `en` | `n` |
| `eng` | `g` |

### 5. 复韵母简写

| 标准 | 输入码 |
|---|---|
| `uo` | `o`（额外 `uo`） |
| `uai` | `ui` |
| `ui` | `ue` |
| `iao` | `io` |
| `iu` | `iu` |

---

## 六、整体认读 / 零声母

| 标准 | 输入 |
|---|---|
| `yi` | `i` |
| `yin` | `in` |
| `ying` | `ig`（额外编码 `in`） |
| `wu` | `u` |
| `yu` | `y` |
| `yue` | `ye` |
| `yuan` | `yw` |
| `yun` | `yn` |
| `yong` | `yg` |
| `yo` | `yo` |
| `you` | `iu` |
| `ya` | `ia` |
| `yan` | `iw` |
| `yang` | `iv` |
| `yao` | `io` |
| `ye` | `ie` |
| `wa` | `ua` |
| `wai` | `ui` |
| `wan` | `uw` |
| `wang` | `uv` |
| `wei` | `ue` |
| `wen` | `un` |
| `weng` | `ug` |
| `wo` | `o` |

---

## 七、额外编码（不是主编码，但可额外输入）

- `er` 也可输入 `ar`
- `o` 是主编码，`uo` 是额外编码：  
  以 `o` 结尾的码，也可加 `u` 输入，如 `do` 也可输入 `duo`
- `g` 在 `b p m f` 后会音变成 `ug`：  
  `bg / pg / mg / fg` 也可输入 `bug / pug / mug / fug`
- `g` 在其余声母后会音变成 `n`：  
  `dg / tg / ng / lg / gg / kg / hg / jg / qg / xg / zg / cg / sg / rg`  
  也可输入 `dn / tn / nn / ln / gn / kn / hn / jn / qn / xn / zn / cn / sn / rn`
- `ig` 会音变成 `in`：  
  `ig` 结尾也可输入 `in`

---

## 八、超级简拼

- 取音节首字母作为简拼。
- 带声调时，取 **首字母 + 声调符号**。
- 例：`juv＼` → 简拼 `j＼`

---

## 九、示例

| 标准拼音 | 自创编码 |
|---|---|
| `zhōng` | `jug－` |
| `zhuàng` | `juv＼` |
| `xióng` | `xyg／` |
| `yīng` | `ig－` |
| `yǒng` | `yg｜` |
| `juǎn` | `jyw｜` |
| `jūn` | `jyn－` |
| `guì` | `gue＼` |
| `liú` | `liu／` |
| `duō` | `do－` |
| `diǎn` | `diw｜` |
| `dàng` | `dv＼` |
| `děng` | `dg｜` |
| `dōng` | `dug－` |
| `mā` | `ma－` |
| `má` | `ma／` |
| `mǎ` | `ma｜` |
| `mà` | `ma＼` |
| `字` | `z` |
| `在` | `z＿` |
| `再` | `z￣` |
| `他` | `t` |
| `她` | `t＿` |
| `它` | `t￣` |

---

## 十、注意事项

1. 每个音素只有一个身份：声母、介母、韵母。
2. 声介韵可任意组合，但需符合实际拼音。
3. `er` / `ar` 是特殊音节，不能与其他组合。
4. 声调符号写在编码末尾。
5. `＿` 和 `￣` 仅用于自定义短语，表示同一编码的不同变种。
6. `o` 的发音就是 `uo`，但以 `o` 为主，`uo` 作为额外输入。
7. `g` 在 `b p m f` 后音变成 `ug`，在其余声母后音变成 `n`；`ig` 音变成 `in`，因此它们有不止一种编码。
8. `iong` 的介母是 `y`，不属于介母 `i`。

---

## 附录：完整音节表

> 表格按原表结构，使用合并单元格。  
> 声母列合并其下的 `/ i u y` 四行。

<table>
<thead>
<tr>
<th rowspan="2">声母</th>
<th rowspan="2">介母</th>
<th rowspan="2">韵母</th>
<th colspan="3">单韵母</th>
<th colspan="4">复韵母</th>
<th colspan="4">鼻韵母</th>
</tr>
<tr>
<th>a</th>
<th>o</th>
<th>e</th>
<th>ai</th>
<th>ei</th>
<th>ao</th>
<th>ou</th>
<th>w</th>
<th>v</th>
<th>n</th>
<th>g</th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="4">/</td>
<td>/</td>
<td>ar/er</td>
<td>a</td>
<td>o</td>
<td>e</td>
<td>ai</td>
<td>ei</td>
<td>ao</td>
<td>ou</td>
<td>w</td>
<td>v</td>
<td>n</td>
<td>g</td>
</tr>
<tr>
<td>i</td>
<td>i</td>
<td>ia</td>
<td></td>
<td>ie</td>
<td></td>
<td></td>
<td>io</td>
<td>iu</td>
<td>iw</td>
<td>iv</td>
<td>in</td>
<td>ig</td>
</tr>
<tr>
<td>u</td>
<td>u</td>
<td>ua</td>
<td>uo</td>
<td></td>
<td>ui</td>
<td>ue</td>
<td></td>
<td></td>
<td>uw</td>
<td>uv</td>
<td>un</td>
<td>ug</td>
</tr>
<tr>
<td>y</td>
<td>y</td>
<td></td>
<td></td>
<td>ye</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>yw</td>
<td></td>
<td>yn</td>
<td>yg</td>
</tr>

<tr>
<td rowspan="4">b</td>
<td>/</td>
<td></td>
<td>ba</td>
<td>bo</td>
<td></td>
<td>bai</td>
<td>bei</td>
<td>bao</td>
<td></td>
<td>bw</td>
<td>bv</td>
<td>bn</td>
<td>bg</td>
</tr>
<tr>
<td>i</td>
<td>bi</td>
<td></td>
<td></td>
<td>bie</td>
<td></td>
<td></td>
<td>bio</td>
<td></td>
<td>biw</td>
<td>biv</td>
<td>bin</td>
<td>big</td>
</tr>
<tr>
<td>u</td>
<td>bu</td>
<td></td>
<td>buo</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>bug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">p</td>
<td>/</td>
<td></td>
<td>pa</td>
<td>po</td>
<td></td>
<td>pai</td>
<td>pei</td>
<td>pao</td>
<td></td>
<td>pw</td>
<td>pv</td>
<td>pn</td>
<td>pg</td>
</tr>
<tr>
<td>i</td>
<td>pi</td>
<td></td>
<td></td>
<td>pie</td>
<td></td>
<td></td>
<td>pio</td>
<td></td>
<td>piw</td>
<td></td>
<td>pin</td>
<td>pig</td>
</tr>
<tr>
<td>u</td>
<td>pu</td>
<td></td>
<td>puo</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>pug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">m</td>
<td>/</td>
<td></td>
<td>ma</td>
<td>mo</td>
<td></td>
<td>mai</td>
<td>mei</td>
<td>mao</td>
<td>mou</td>
<td>mw</td>
<td>mv</td>
<td>mn</td>
<td>mg</td>
</tr>
<tr>
<td>i</td>
<td>mi</td>
<td></td>
<td></td>
<td>mie</td>
<td></td>
<td></td>
<td>mio</td>
<td></td>
<td>miw</td>
<td></td>
<td>min</td>
<td>mig</td>
</tr>
<tr>
<td>u</td>
<td>mu</td>
<td></td>
<td>muo</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>mug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">f</td>
<td>/</td>
<td></td>
<td>fa</td>
<td>fo</td>
<td></td>
<td></td>
<td>fei</td>
<td></td>
<td>fou</td>
<td>fw</td>
<td>fv</td>
<td>fn</td>
<td>fg</td>
</tr>
<tr>
<td>i</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>fio</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>u</td>
<td>fu</td>
<td></td>
<td>fuo</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>fug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">d</td>
<td>/</td>
<td></td>
<td>da</td>
<td></td>
<td>de</td>
<td>dai</td>
<td>dei</td>
<td>dao</td>
<td>dou</td>
<td>dw</td>
<td>dv</td>
<td>dn</td>
<td>dg</td>
</tr>
<tr>
<td>i</td>
<td>di</td>
<td>dia</td>
<td></td>
<td>die</td>
<td></td>
<td></td>
<td>dio</td>
<td>diu</td>
<td>diw</td>
<td></td>
<td></td>
<td>dig</td>
</tr>
<tr>
<td>u</td>
<td>du</td>
<td></td>
<td>duo</td>
<td></td>
<td></td>
<td>due</td>
<td></td>
<td></td>
<td>duw</td>
<td></td>
<td>dun</td>
<td>dug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">t</td>
<td>/</td>
<td></td>
<td>ta</td>
<td></td>
<td>te</td>
<td>tai</td>
<td>tei</td>
<td>tao</td>
<td>tou</td>
<td>tw</td>
<td>tv</td>
<td></td>
<td>tg</td>
</tr>
<tr>
<td>i</td>
<td>ti</td>
<td></td>
<td></td>
<td>tie</td>
<td></td>
<td></td>
<td>tio</td>
<td></td>
<td>tiw</td>
<td></td>
<td></td>
<td>tig</td>
</tr>
<tr>
<td>u</td>
<td>tu</td>
<td></td>
<td>tuo</td>
<td></td>
<td></td>
<td>tue</td>
<td></td>
<td></td>
<td>tuw</td>
<td></td>
<td>tun</td>
<td>tug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">n</td>
<td>/</td>
<td></td>
<td>na</td>
<td></td>
<td>ne</td>
<td>nai</td>
<td>nei</td>
<td>nao</td>
<td>nou</td>
<td>nw</td>
<td>nv</td>
<td>nn</td>
<td>ng</td>
</tr>
<tr>
<td>i</td>
<td>ni</td>
<td></td>
<td></td>
<td>nie</td>
<td></td>
<td></td>
<td>nio</td>
<td>niu</td>
<td>niw</td>
<td>niv</td>
<td>nin</td>
<td>nig</td>
</tr>
<tr>
<td>u</td>
<td>nu</td>
<td></td>
<td>nuo</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>nuw</td>
<td></td>
<td></td>
<td>nug</td>
</tr>
<tr>
<td>y</td>
<td>ny</td>
<td></td>
<td></td>
<td>nye</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">l</td>
<td>/</td>
<td></td>
<td>la</td>
<td></td>
<td>le</td>
<td>lai</td>
<td>lei</td>
<td>lao</td>
<td>lou</td>
<td>lan</td>
<td>lv</td>
<td></td>
<td>lg</td>
</tr>
<tr>
<td>i</td>
<td>li</td>
<td></td>
<td></td>
<td>lie</td>
<td></td>
<td></td>
<td>lio</td>
<td>liu</td>
<td>liw</td>
<td>liv</td>
<td>ln</td>
<td>lig</td>
</tr>
<tr>
<td>u</td>
<td>lu</td>
<td></td>
<td>luo</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>luw</td>
<td></td>
<td>lun</td>
<td>lug</td>
</tr>
<tr>
<td>y</td>
<td>ly</td>
<td></td>
<td></td>
<td>lye</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">g</td>
<td>/</td>
<td></td>
<td>ga</td>
<td>go</td>
<td>ge</td>
<td>gai</td>
<td>gei</td>
<td>gao</td>
<td>gou</td>
<td>gw</td>
<td>gv</td>
<td>gn</td>
<td>gg</td>
</tr>
<tr>
<td>i</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>u</td>
<td>gu</td>
<td>gua</td>
<td>guo</td>
<td></td>
<td>gui</td>
<td>gue</td>
<td></td>
<td></td>
<td>guw</td>
<td>guv</td>
<td>gun</td>
<td>gug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">k</td>
<td>/</td>
<td></td>
<td>ka</td>
<td>ko</td>
<td>ke</td>
<td>kai</td>
<td>kei</td>
<td>kao</td>
<td>kou</td>
<td>kw</td>
<td>kv</td>
<td>kn</td>
<td>kg</td>
</tr>
<tr>
<td>i</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>u</td>
<td>ku</td>
<td>kua</td>
<td>kuo</td>
<td></td>
<td>kui</td>
<td>kue</td>
<td></td>
<td></td>
<td>kuw</td>
<td>kuv</td>
<td>kun</td>
<td>kug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">h</td>
<td>/</td>
<td></td>
<td>ha</td>
<td>ho</td>
<td>he</td>
<td>hai</td>
<td>hei</td>
<td>hao</td>
<td>hou</td>
<td>hw</td>
<td>hv</td>
<td>hn</td>
<td>hg</td>
</tr>
<tr>
<td>i</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>u</td>
<td>hu</td>
<td>hua</td>
<td>huo</td>
<td></td>
<td>hui</td>
<td>hue</td>
<td></td>
<td></td>
<td>huw</td>
<td>huv</td>
<td>hun</td>
<td>hug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">j</td>
<td>/</td>
<td>j</td>
<td>ja</td>
<td>jo</td>
<td>je</td>
<td>jai</td>
<td>jei</td>
<td>jao</td>
<td>jou</td>
<td>jw</td>
<td>jv</td>
<td>jn</td>
<td>jg</td>
</tr>
<tr>
<td>i</td>
<td>ji</td>
<td>jia</td>
<td></td>
<td>jie</td>
<td></td>
<td></td>
<td>jio</td>
<td>jiu</td>
<td>jiw</td>
<td>jiv</td>
<td>jin</td>
<td>jig</td>
</tr>
<tr>
<td>u</td>
<td>ju</td>
<td></td>
<td>juo</td>
<td></td>
<td>jui</td>
<td>jue</td>
<td></td>
<td></td>
<td>juw</td>
<td>juv</td>
<td>jun</td>
<td>jug</td>
</tr>
<tr>
<td>y</td>
<td>jy</td>
<td></td>
<td></td>
<td>jye</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>jyw</td>
<td></td>
<td>jyn</td>
<td>jyg</td>
</tr>

<tr>
<td rowspan="4">q</td>
<td>/</td>
<td>q</td>
<td>qa</td>
<td>qo</td>
<td>qe</td>
<td>qai</td>
<td></td>
<td>qao</td>
<td>qou</td>
<td>qw</td>
<td>qv</td>
<td>qn</td>
<td>qg</td>
</tr>
<tr>
<td>i</td>
<td>qi</td>
<td>qia</td>
<td></td>
<td>qie</td>
<td></td>
<td></td>
<td>qio</td>
<td>qiu</td>
<td>qiw</td>
<td>qiv</td>
<td>qin</td>
<td>qig</td>
</tr>
<tr>
<td>u</td>
<td>qu</td>
<td></td>
<td>quo</td>
<td></td>
<td>qui</td>
<td>que</td>
<td></td>
<td></td>
<td>quw</td>
<td>quv</td>
<td>qun</td>
<td>qug</td>
</tr>
<tr>
<td>y</td>
<td>qy</td>
<td></td>
<td></td>
<td>qye</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>qyw</td>
<td></td>
<td>qyn</td>
<td>qyg</td>
</tr>

<tr>
<td rowspan="4">x</td>
<td>/</td>
<td>x</td>
<td>xa</td>
<td>xo</td>
<td>xe</td>
<td>xai</td>
<td>xei</td>
<td>xao</td>
<td>xou</td>
<td>xw</td>
<td>xv</td>
<td>xn</td>
<td>xg</td>
</tr>
<tr>
<td>i</td>
<td>xi</td>
<td>xia</td>
<td></td>
<td>xie</td>
<td></td>
<td></td>
<td>xio</td>
<td>xiu</td>
<td>xiw</td>
<td>xiv</td>
<td>xin</td>
<td>xig</td>
</tr>
<tr>
<td>u</td>
<td>xu</td>
<td></td>
<td>xuo</td>
<td></td>
<td>xui</td>
<td>xue</td>
<td></td>
<td></td>
<td>xuw</td>
<td>xuv</td>
<td>xun</td>
<td></td>
</tr>
<tr>
<td>y</td>
<td>xy</td>
<td></td>
<td></td>
<td>xye</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>xyw</td>
<td></td>
<td>xyn</td>
<td>xyg</td>
</tr>

<tr>
<td rowspan="4">z</td>
<td>/</td>
<td>z</td>
<td>za</td>
<td>zo</td>
<td>ze</td>
<td>zai</td>
<td>zei</td>
<td>zao</td>
<td>zou</td>
<td>zw</td>
<td>zv</td>
<td>zn</td>
<td>zg</td>
</tr>
<tr>
<td>i</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>u</td>
<td>zu</td>
<td></td>
<td>zuo</td>
<td></td>
<td></td>
<td>zue</td>
<td></td>
<td></td>
<td>zuw</td>
<td></td>
<td>zun</td>
<td>zug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">c</td>
<td>/</td>
<td>c</td>
<td>ca</td>
<td>co</td>
<td>ce</td>
<td>cai</td>
<td>cei</td>
<td>cao</td>
<td>cou</td>
<td>cw</td>
<td>zv</td>
<td>cn</td>
<td>cg</td>
</tr>
<tr>
<td>i</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>u</td>
<td>cu</td>
<td></td>
<td>cuo</td>
<td></td>
<td></td>
<td>cue</td>
<td></td>
<td></td>
<td>cuw</td>
<td></td>
<td>cun</td>
<td>cug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">s</td>
<td>/</td>
<td>s</td>
<td>sa</td>
<td>so</td>
<td>se</td>
<td>sai</td>
<td></td>
<td>sao</td>
<td>sou</td>
<td>sw</td>
<td>sv</td>
<td>sn</td>
<td>sg</td>
</tr>
<tr>
<td>i</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>u</td>
<td>su</td>
<td></td>
<td>suo</td>
<td></td>
<td></td>
<td>sue</td>
<td></td>
<td></td>
<td>suw</td>
<td></td>
<td>sun</td>
<td>sug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>

<tr>
<td rowspan="4">r</td>
<td>/</td>
<td>r</td>
<td></td>
<td>ro</td>
<td>re</td>
<td></td>
<td></td>
<td>rao</td>
<td>rou</td>
<td>rw</td>
<td>rv</td>
<td>rn</td>
<td>rg</td>
</tr>
<tr>
<td>i</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>u</td>
<td>ru</td>
<td></td>
<td>ruo</td>
<td></td>
<td></td>
<td>rue</td>
<td></td>
<td></td>
<td>ruw</td>
<td></td>
<td>run</td>
<td>rug</td>
</tr>
<tr>
<td>y</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>