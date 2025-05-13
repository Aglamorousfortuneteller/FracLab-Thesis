# FracLab — Fractal Analysis and 3D Visualization of Medical Images

**FracLab** is a MATLAB-based software system developed as part of a master's thesis project at ITMO University. It provides tools for automated fractal analysis and visualization of medical tomographic images (DICOM), including 2D ROI-based analysis and 3D threshold-based reconstruction.

This software was officially registered and later used for research at the Pavlov Institute of Physiology of the Russian Academy of Sciences.

---

## 🎓 Origin

**Thesis title:**  
**"Development of Algorithms for Implementing Computational and Analytical Methods for Express Analysis of Changes in Medical Images"**

**Author:** Elizaveta Karaseva  
**Institution:** ITMO University  
**Year:** 2019

---

## 💾 Components

- `fraclab.m` — fractal analysis with ROI and calculation of fractal dimension, Hurst exponent, lacunarity
- `facefraclab.fig/.m` — GUI built with MATLAB GUIDE
- `dicom_viewer.m` — DICOM viewer with interactive 3D rendering using `isosurface`
- `runfraclab.m` / `run_dicom_viewer.m` — starter scripts

---

## 🔍 Features

- Load DICOM/PNG/JPG images
- Manual region of interest (ROI) selection
- Compute:
  - Fractal dimension (box-counting)
  - Hurst exponent
  - Lacunarity
- Interactive 3D rendering with threshold control (optical density)
- Slice viewer with slider
- Excel export of results
- Pixel size support via DICOM metadata (PixelSpacing / SliceThickness)

---

## 📝 Publications

- [IEEE, 2019 — Automatic Analysis of Medical Images Based on Fractal Methods](https://doi.org/10.1109/ITQMIS.2019.8928378)
- [IEEE, 2019 — Application of Box-Counting for Medical Image Evaluation](https://doi.org/10.1109/ITQMIS.2019.8928375)
- [APJCP, 2018 — MRI Segmentation in Dynamic Programming Mode](https://doi.org/10.22034/APJCP.2018.19.10.2771)
- [REJR, 2018 — Application of Fractal Analysis on MRI Images (RU)](https://doi.org/10.21569/2222-7415-2018-8-3-107-112)

---

## 🧾 Software Registration

Registered in Rospatent (Russian Federal Service for Intellectual Property):

- **Title:** Software system for automated fractal analysis of images (FracLab)
- **Certificate No:** 2019615954
- **Date:** May 15, 2019

---

## 🧪 Scientific Use

FracLab has been used in research conducted at the **Pavlov Institute of Physiology** (RAS), including:

- Tomographic image segmentation
- Tissue structure classification using fractal features
- Textural analysis of pathological zones

---

## How to Run

% Run the GUI for fractal analysis
runfraclab

% Open the DICOM viewer and 3D visualizer
dicom_viewer

--

## 📁 Project Structure

├── BR.png
├── fraclab.m
├── facefraclab.m / .fig
├── runfraclab.m
├── dicom_viewer.m
├── run_dicom_viewer.m
└── README.md

## License
© Elizaveta Karaseva, 2019–2025
Non-commercial academic use permitted.


## На русском языке

# FracLab — Фрактальный анализ и 3D-визуализация медицинских изображений

**FracLab** — MATLAB-программа, разработанная в рамках магистерской диссертации в Университете ИТМО. Она включает инструменты для автоматизированного фрактального анализа медицинских изображений (DICOM), включая анализ областей интереса (ROI) и интерактивную 3D-визуализацию по порогу.

Программа была официально зарегистрирована как ПО и использовалась в исследованиях в Институте физиологии им. И.П. Павлова РАН.

---

## 🎓 Происхождение проекта

**Тема диссертации:**  
**«Разработка алгоритмов реализации вычислительно-аналитических методов для экспресс-анализа изменений на медицинских изображениях»**

**Автор:** Елизавета Карасева  
**Университет:** ИТМО  
**Год:** 2019

---

## 💾 Компоненты

- `fraclab.m` — фрактальный анализ с ROI, расчёт фрактальной размерности, Хёрста и лакунарности
- `facefraclab.fig/.m` — графический интерфейс на MATLAB GUIDE
- `dicom_viewer.m` — просмотр DICOM с интерактивной 3D-визуализацией
- `runfraclab.m`, `run_dicom_viewer.m` — запуск

---

## 📊 Возможности

- Загрузка изображений (DICOM, PNG, JPG)
- Ручной выбор области интереса (ROI)
- Расчёт:
  - Фрактальной размерности (метод box-counting)
  - Показателя Хёрста
  - Лакунарности
- Интерактивная 3D-визуализация с порогом (оптическая плотность)
- Просмотр слайсов с ползунком
- Сохранение в Excel
- Учёт физического размера пикселя (PixelSpacing, SliceThickness)

---

## 📝 Публикации

- [IEEE, 2019 — Автоматический анализ медицинских изображений на основе фрактальных методов](https://doi.org/10.1109/ITQMIS.2019.8928378)
- [IEEE, 2019 — Оценка медицинских изображений методом box-counting](https://doi.org/10.1109/ITQMIS.2019.8928375)
- [APJCP, 2018 — Сегментация МРТ в режиме динамического программирования](https://doi.org/10.22034/APJCP.2018.19.10.2771)
- [REJR, 2018 — Применение фрактального анализа для МРТ](https://doi.org/10.21569/2222-7415-2018-8-3-107-112)

---

## 📜 Свидетельство о регистрации ПО

- **Название:** Программный комплекс для автоматизированного фрактального анализа изображений (FracLab)  
- **Номер:** № 2019615954  
- **Дата регистрации:** 15.05.2019  
- **Роспатент:** [Ссылка на ФИПС](http://www1.fips.ru/fips_servl/fips_servlet?DB=EVM&DocNumber=2019615954&TypeFile=html)

---

## 🧪 Использование в НИИ

FracLab применялся в научных исследованиях **Института физиологии им. И.П. Павлова РАН**, включая:

- Сегментацию томографических данных
- Классификацию тканей по фрактальным признакам
- Анализ текстурных свойств патологий

---

## Как запустить

% Фрактальный анализ (GUI):
runfraclab

% DICOM просмотр и 3D:
dicom_viewer

---

## 📁 Структура проекта

├── BR.png
├── fraclab.m
├── facefraclab.m / .fig
├── runfraclab.m
├── dicom_viewer.m
├── run_dicom_viewer.m
└── README.md
##  Лицензия
© Елизавета Карасева, 2019–2025
Допускается некоммерческое использование в исследовательских и образовательных целях.