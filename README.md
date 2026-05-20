# Data Wrangler

A lightweight and interactive **R Shiny** application for performing common data wrangling tasks **without writing code**.

This tool allows users to load datasets from URLs, clean and transform data through a graphical interface, preview changes live, and safely experiment using a built-in undo system.

---

## Features

### Current Features

- Load datasets from:
  - Delimited text files (CSV, TSV, etc.)
  - Excel files (`.xlsx`)
  - JSON files

- Live dataframe preview with interactive tables

- Column type conversion:
  - Character
  - Numeric
  - Integer
  - Factor
  - Date
  - Logical

- Missing value handling:
  - Mean imputation
  - Median imputation
  - Mode imputation
  - Replace with constants
  - Drop missing rows

- Data filtering with:
  - Comparison operators
  - Multiple filter chaining
  - AND / OR logic

- Export cleaned data to:
  - CSV
  - Excel

- Missing value summary dashboard

- Undo system:
  - Restore previous dataframe states
  - Safe experimentation during transformations

---

## Why This Project?

Most data wrangling tools either require programming knowledge or provide limited transparency into transformations.

This project focuses on:
- No-code data manipulation
- Immediate visual feedback
- Beginner-friendly workflows
- Safer experimentation through undo support

---

## Tech Stack

- **R**
- **Shiny**
- **DT**
- **tidyverse**
- **openxlsx**
- **jsonlite**
- **shinyjs**

---

## Future Features

Planned improvements inspired by `tidyverse` and SQL workflows:

### Data Manipulation
- Arrange / sort rows
- Rename columns
- Select and reorder columns
- Mutate / create derived columns
- Conditional transformations

### Reshaping
- Pivot longer / wider
- Separate and unite columns
- Nested data support

### Summarization
- Group by + summarize
- Aggregate statistics
- Frequency tables
- Window functions

### Combining Data
- Left / right / inner / full joins
- Row binding
- Column binding
- Duplicate detection

### SQL-style Features
- Query builder interface
- Generated SQL preview
- Database connectivity

### UX Improvements
- Transformation history panel
- Redo support
- Pipeline visualization
- Drag-and-drop workflow builder
- Save/load wrangling sessions

---

## Installation

```r
install.packages(c(
  "shiny",
  "DT",
  "tidyverse",
  "jsonlite",
  "openxlsx",
  "shinyjs"
))
