# ACP Figures and Tables Guidelines

## General Requirements

### Figure Quality
- **Resolution**: Minimum 300 dpi for publication
- **Format**: TIFF, EPS, or PDF preferred
- **Color mode**: CMYK for color figures
- **Size**: Fit within column (8.6 cm) or page width (17.8 cm)

### Font Requirements
- **Main text**: 8–10 pt (after reduction)
- **Axis labels**: 9–11 pt
- **Legends**: 8–10 pt
- **Use sans-serif fonts**: Arial, Helvetica, or similar

### Color Guidelines
- **Accessibility**: Ensure colorblind-friendly palettes
- **Consistency**: Use consistent colors across figures
- **Print-friendly**: Test in grayscale for black & white printing

## Figure Types for Atmospheric Science

### 1. Spatial Distribution Maps
**Purpose**: Show geographical patterns of variables

**Elements**:
- Clear coastline and political boundaries
- Color bar with appropriate range
- Latitude/longitude grid
- Scale bar or north arrow (if needed)
- Topography contours (optional)

**Example caption**:
"Figure 1. Spatial distribution of (a) dust aerosol optical depth (AOD) and (b) dust direct radiative forcing at the surface during the Indian summer monsoon season (June–September average for 2010–2019). Stippling indicates regions where differences are statistically significant at the 95% confidence level."

### 2. Time Series and Hovmöller Diagrams
**Purpose**: Show temporal evolution

**Elements**:
- Clear time axis with proper formatting
- Multiple lines distinguished by color/style
- Shading for uncertainty ranges
- Reference lines (climatology, thresholds)

**Example caption**:
"Figure 2. Time series of (a) all-India summer monsoon rainfall anomaly and (b) dust loading index for 2010–2019. Gray shading represents ±1 standard deviation from the ensemble mean. The correlation coefficient (r) and significance level (p) are shown in the inset."

### 3. Vertical Profiles and Cross-sections
**Purpose**: Show vertical structure

**Elements**:
- Pressure/height axis (logarithmic if needed)
- Multiple profiles clearly labeled
- Shading for standard deviations
- Important levels marked (tropopause, etc.)

**Example caption**:
"Figure 3. Vertical profiles of (a) temperature anomaly and (b) specific humidity difference between dust and no-dust simulations averaged over central India (70°–85°E, 15°–25°N). Error bars represent interannual variability (±1 standard deviation)."

### 4. Scatter Plots and Correlation Maps
**Purpose**: Show relationships between variables

**Elements**:
- Regression line with equation
- Confidence intervals
- Correlation coefficient and p-value
- Different markers for categories

**Example caption**:
"Figure 4. Scatter plot of dust radiative forcing versus monsoon rainfall anomaly for 2010–2019. Colors represent different subregions: northwestern India (blue), central India (green), and northeastern India (red). The linear regression line (solid) and 95% confidence interval (shaded) are shown."

### 5. Process Diagrams and Schematics
**Purpose**: Illustrate mechanisms

**Elements**:
- Clear arrows showing direction
- Minimal text within figure
- Consistent style and colors
- Legend for symbols

**Example caption**:
"Figure 5. Schematic diagram illustrating the proposed mechanisms of dust-monsoon interactions. Red arrows indicate enhanced processes, blue arrows indicate suppressed processes, and black arrows show circulation changes."

## Tables Guidelines

### Formatting Requirements
- **Numbering**: Arabic numerals (Table 1, Table 2)
- **Title**: Above the table
- **Footnotes**: Below the table
- **Lines**: Use horizontal lines only (no vertical lines)
- **Alignment**: Numerical data right-aligned, text left-aligned

### Content Guidelines
- Include units in column headers
- Show uncertainty values (e.g., 15.2 ± 1.3)
- Use consistent decimal places
- Include sample size (n) where applicable

**Example table structure**:
```
Table 1. Statistical metrics comparing model simulations with observations.

| Region          | Correlation (r) | RMSE (mm/day) | Bias (%) |
|-----------------|-----------------|---------------|----------|
| Northwestern    | 0.85 ± 0.03     | 1.2 ± 0.1     | +5.2     |
| Central         | 0.78 ± 0.04     | 1.5 ± 0.2     | -3.1     |
| Northeastern    | 0.82 ± 0.03     | 1.3 ± 0.1     | +2.4     |
```

## Color Palettes for Atmospheric Science

### Sequential (for magnitude)
- Blue: `#eff3ff`, `#bdd7e7`, `#6baed6`, `#3182bd`, `#08519c`
- Red: `#fee5d9`, `#fcae91`, `#fb6a4a`, `#de2d26`, `#a50f15`
- Viridis: `#440154`, `#31688e`, `#35b779`, `#fde725`

### Diverging (for anomalies)
- Red-Blue: `#67001f`, `#b2182b`, `#d6604d`, `#f4a582`, `#fddbc7`, `#d1e5f0`, `#92c5de`, `#4393c3`, `#2166ac`, `#053061`
- Brown-Blue-Green: `#8c510a`, `#bf812d`, `#dfc27d`, `#f6e8c3`, `#f5f5f5`, `#c7eae5`, `#80cdc1`, `#35978f`, `#01665e`

### Categorical (for different categories)
- Set3: `#8dd3c7`, `#ffffb3`, `#bebada`, `#fb8072`, `#80b1d3`, `#fdb462`, `#b3de69`, `#fccde5`, `#d9d9d9`

## Accessibility Considerations

### Colorblind-Friendly Palettes
- Avoid red-green combinations
- Use color + pattern + shape
- Test with colorblind simulators

### Text Alternatives
- Ensure sufficient contrast (minimum 4.5:1)
- Use bold for emphasis, not just color
- Include descriptive captions

## Submission Checklist

### Before Submission
- [ ] All figures meet resolution requirements
- [ ] Font sizes appropriate after reduction
- [ ] Color palettes are print-friendly
- [ ] Figures work in grayscale
- [ ] All elements are vector-based or high-resolution
- [ ] Consistent style across all figures

### Caption Requirements
- [ ] Self-contained explanation
- [ ] All abbreviations defined
- [ ] Statistical significance indicated
- [ ] Error bars/uncertainty described
- [ ] Scale bars included where needed

### File Organization
- [ ] Separate files for each figure
- [ ] Descriptive file names (Fig1_Temperature.pdf)
- [ ] No embedded figures in manuscript text
- [ ] All source data available

## Common Mistakes to Avoid

1. **Too small fonts** - Will be illegible after reduction
2. **Overly complex figures** - One clear message per figure
3. **Inconsistent scales** - Makes comparison difficult
4. **Missing error bars** - Essential for scientific rigor
5. **Poor color choices** - May not print or copy well
6. **Crowded legends** - Keep legends concise
7. **Unlabeled axes** - Always include units
8. **Low resolution** - Will appear pixelated in print