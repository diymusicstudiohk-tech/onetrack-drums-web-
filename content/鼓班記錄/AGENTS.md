# 鼓班記錄 Agent Instructions
- [[../Onetrack Studio 預約上課時間表（自動更新）|點擊查看時間表]]

本資料夾主要存放學生學鼓檔案。任何 AI agent 修改或新增 `*的學鼓檔案.md` 時，先參考 `學鼓檔案TEMPLATE.md`，並遵守以下格式。

## 學鼓檔案整體風格

- 使用 Obsidian Markdown callout，不要改成表格、frontmatter、JSON 或過度正式的報告格式。
- 語氣保持實用、直接、口語化，可自然混合廣東話、英文、樂理/鼓術語，例如 `source`、`today tried`、`next`、`HW`、`fill`、`bar`、`0.8x`、`bpm`。
- 新增內容以「課堂追蹤」為主：今堂做了甚麼、用甚麼 source、速度/段落、未穩位置、下堂或功課。
- 不要大幅重寫舊紀錄、統一所有日期格式、修正所有舊 typo，除非使用者明確要求。優先保留原有手寫紀錄感。

## 檔案命名

- 學生檔案使用：`學生名的學鼓檔案.md`
- 模板檔案是：`學鼓檔案TEMPLATE.md`
- Receipt、影片、PDF 等附件通常以 Obsidian wiki embed/link 引用，例如：
  `![[鼓班記錄/attachments/filename.jpg]]`

## 標準結構

檔案開頭可有一個或多個備註 callout：

```markdown
> [!TIP] [Remark: Leftie]
> [Wishlist: 開發左腳]
```

- 新增學生檔案時，不要令檔案第一行就是 `---`。Obsidian 會把檔案最開頭的 `---` 當成 YAML / Properties frontmatter 開頭，而不是普通分隔線；如果沒有 closing `---`，後面的 callout 可能會顯示成 raw Markdown。新檔案如未有備註，也先放 `> [!TIP] [Remark: ]`，再用 `---` 開始第一期套票。

每一期套票/學期用 `---` 分隔。最新一期通常放最上面，舊紀錄往下排。

每一期標準順序：

1. `WARNING` callout：上課日期與剩餘堂數
2. `***課堂記錄***`
3. 多個 `NOTE` callout：每堂課記錄，通常最新日期在最上
4. `QUOTE` callout：購買記錄、有效期、receipt

## 套票區塊格式

4 堂套票：

```markdown
---

> [!WARNING] ***上課日期與剩餘堂數：***
> 1_  2026-05-14
> 2_  2026-05-21
> 3_
> 4_
>

***課堂記錄***

> [!NOTE] **[2026-05-21]**
> source: song name.mp4
>
> today tried 0.8x till 2nd C
> bar 45-49 not stable
> next: end song
>

> [!QUOTE] ***購買記錄***
> 在 2026-05-14 已購買4堂，有效期至 2026-07-09
> ![[鼓班記錄/attachments/receipt.jpg]]
```

8 堂套票同樣格式，但 `WARNING` 內列 `1_` 至 `8_`。如有補堂、遲到補時、上一期剩餘時間，可加 `9_ (...)` 或直接在相關 numbered line 後補充。

## 日期與有效期

- 新增日期時優先使用 `YYYY-MM-DD`，例如 `2026-05-28`。
- 舊檔已有 `2026-5-28`、`2026/5/28` 等格式時，不必為了統一而改舊資料。
- 模板規則：4 堂有效期約 8 星期；8 堂有效期約 16 星期。若 receipt、舊紀錄或使用者指示有不同，以該次紀錄為準。
- 今日日期要按目前實際日期，不要憑記憶估。

## 新增一堂課

當使用者要求新增課堂記錄：

- 找最新一期，即檔案最上方第一個未完結或最相關套票區塊。
- 在 `WARNING` 補下一個空白 numbered slot，例如 `> 3_  2026-05-28`。
- 在 `***課堂記錄***` 下方加入新的 `NOTE` callout，通常放在該期其他 `NOTE` 之上。
- 每行都保持 quote prefix `>`，空行也可用 `>` 保持 callout 連續。
- 如資料不足，用 `待輸入` 或保留空位，不要自行幻想課堂內容。

課堂 note 常見內容順序：

```markdown
> [!NOTE] **[2026-05-28]**
> source: full song example.mp4
>
> 今日 tried full song 0.9x
> bar 69-71 not stable
> next: end song / new song
>
```

## 新增購買記錄

新購買一套堂數時，通常在檔案最上方新增一整個套票區塊，舊一期留在下面。購買記錄使用：

```markdown
> [!QUOTE] ***購買記錄***
> 在 2026-05-28 已購買4堂，有效期至 2026-07-23
> (paid by Payme)
> ![[鼓班記錄/attachments/receipt.jpg]]
```

若未有 receipt 或資料未齊，可用 `(待填寫)`，不要刪除購買記錄區。

## 編輯守則

- 保留 Obsidian callout 語法：`> [!TIP]`、`> [!WARNING]`、`> [!NOTE]`、`> [!QUOTE]`。
- 保留 `***課堂記錄***`、`***購買記錄***`、`***上課日期與剩餘堂數：***` 這類粗斜體標題風格。
- 儘量只改使用者指定學生/指定區塊；不要批量清理整個 vault。
- 不要移除 receipt、影片、PDF、gscribe/youtube link。
- 如發現堂數、日期或有效期明顯矛盾，先保留原文並用一句簡短括號註明疑問；不要靜默改數。
