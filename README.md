# CRAVAT-P Galaxy Docker

A Docker image containing a fully-operational Galaxy instance with pre-installed demonstration material for CRAVAT-P.

<a href="#cravat-p-tutorial">![main screen](https://github.com/jraysajulga/cravatp-galaxy-docker/blob/master/graphics/main-screen.png?raw=true)</a>

*Created as a demonstration for the following technical note for the Journal of Proteome Research*:

> <a target="_blank" href="https://pubs.acs.org/doi/10.1021/acs.jproteome.8b00404">**Bridging the Chromosome-Centric and Biology and Disease Human Proteome Projects: Accessible and automated tools for interpreting biological and pathological impact of protein sequence variants detected via proteogenomics**</a>

> Ray Sajulga, Subina Mehta, Praveen Kumar, James E. Johnson, Candace R. Guerrero, Michael C. Ryan, Rachel Karchin, Pratik D. Jagtap, and Timothy J. Griffin

### What's included
- <a target="_blank" href="https://github.com/galaxyproject/galaxy/tree/release_17.09">Galaxy Instance (version 17.09)</a>
- <a target="_blank" href="https://github.com/jraysajulga/cravatp_score_and_annotate">CRAVAT-P submit, intersect, annotate, and retrieve Galaxy tool</a>
- <a target="_blank" href="https://github.com/jraysajulga/CRAVAT-Galaxy-Visualizer">CRAVAT-P Galaxy Viewer</a> (<a target="_blank" href="https://galaxyproject.org/develop/visualizations/">Galaxy Visualization Plugin</a>)
- Input files (i.e., VCF and proBED files)
- Basic CRAVAT-P Workflow

---

# Table of Contents
- [*Installation Guide*](#installation-guide-)
- [*Background*](#background-)
  * [*CRAVAT-P*](#cravat-p-)
  * [*Galaxy tool*](#galaxy-tool-)
  * [*Galaxy workflow*](#galaxy-workflow-)
  * [*Galaxy viewer plugin*](#galaxy-viewer-plugin-)
- [*CRAVAT-P Tutorial*](#cravat-p-tutorial-)
  * [1.) Import the input files](#1-import-the-input-files-from-the-data-library-)
  * [2.) Run the workflow](#2-log-in-and-run-the-workflow-)
  * [3.) Access the viewer](#3-access-the-viewer-)

---


# Installation Guide [⤴](#table-of-contents)
1.) Install Docker for  [Mac](https://docs.docker.com/docker-for-mac/install/) or [PC](https://docs.docker.com/docker-for-windows/install/). Open Docker.

2.) Open your terminal. Run the following command:
```sh
docker run -d -p 8080:80 galaxyp/cravatp
```
The image will now download from the public repository <a target="_blank" href="https://hub.docker.com/r/galaxyp/cravatp/">*galaxyp/cravatp*</a> on Docker Hub. This should take around 15 minutes to download.

> In the meanwhile, feel free to take some time to understand the different components of this Docker command. You can also read up on CRAVAT-P background information in the next [section](#background-).

| Component                         | Type         | Description                                                     |
| --------------------------------- | -----------  | --------------------------------------------------------------- |
| docker                            | Base command | The base command for the Docker CLI (Command Language Interface)|
| run                               | Command      | Run a command in a new container                                |
| -d, --detach                      | OPTION       | Run container in background and print container ID              |
| -p, --publish                     | OPTION       | Publish a container's port(s) to the host                       |
| galaxyp/cravatp		    | IMAGE        | **galaxyp's** *cravatp* image                 |

> *More documentation can be found at [Docker's documentation website](https://docs.docker.com/engine/reference/commandline/docker/)*.

3.) Once the command is finished, wait a few moments for the Docker image to initialize as a container.
Open **http://localhost:8080** and **follow the [CRAVAT-P tutorial](#cravat-p-tutorial-) to access the CRAVAT-P suite**. *If you do not see the Galaxy screen, wait a few seconds and then reload the page*.

**Once you are finished using this container, you can clean up your workspace by simply exiting out of Docker.**

---

# Background [⤴](#table-of-contents)

### CRAVAT-P [⤴](#table-of-contents)
(<b>C</b>ancer <b>R</b>elated <b>A</b>nalysis of <b>VA</b>riants <b>T</b>oolkit - <b>P</b>roteomics)

CRAVAT-P is a proteomic extension of CRAVAT (http://cravat.us) developed for the Galaxy-P (http://galaxyp.org) bioinformatics platform. CRAVAT-P exists as a downstream analysis suite for peptide variants. Current support is tailored towards workflows that generate peptide sequences mapped to genomic locations. 

### Galaxy Tool [⤴](#table-of-contents)

<img src="./graphics/tool.png" alt="tool" width="100%"/>

The figure above shows the Galaxy tool developed for submitting jobs to the CRAVAT server. It extends from an earlier version of [*In Silico Solutions*'](http://insilico.us.com) Galaxy tool ([cravat_score_and_annotate](https://toolshed.g2.bx.psu.edu/view/in_silico/cravat_score_and_annotate/67a13940d0bf)). In our CRAVAT-P tool, we added support for additional parameters: [CHASM](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2763410/) classifiers (e.g., breast, brain-glioblastoma-multiforme, etc.) and the older [GRCh37/hg19 human genome build](https://www.ncbi.nlm.nih.gov/assembly/GCF_000001405.13/). We also added proteomic support, as *highlighted by the outlined red box*. Here, a proBED file can be provided for intersection with the genomic input file—VCF (Variant Call Format). You can specify whether you want to output the intersected VCF file or submit only the intersected variants.

#### Example input files

**VCF (Variant Call Format)**

| ID| Chr.| Position| Strand| Ref. base| Alt. base|
| --- | --- | --- | --- | --- | --- |
|VAR527| chr12| 6561055| +| T| C|
|VAR529| chr12| 110339630| +| C| T|
|VAR532| chr14| 102083954| +| C| T|
|VAR539| chr19| 17205335| +| A| T|
|VAR541| chr19| 17205973| +| T| C|
|VAR542| chr19| 18856059| +| C| T|

**ProBED (Proteomic Browser Extensible Data)**

| Chr.| Start | End | Peptide | Strand |
| --- | --- | --- | --- | --- |
| chr12 | 6561014   | 6561056   | <b>S</b>TGVILANDANAER | - |
| chr12 | 110339607 | 110339637 | EWGSGSD<b>I</b>LR     | + |
| chr14 | 102083930 | 102083972 | GVVDSE<b>N</b>LPLNISR | - |
| chr19 | 17205327  | 17206022  | GR<b>M</b>GEPG<b>A</b>EPGHFGVCVDSLTSDK | + |
| chr19 | 18856027  | 18856078  | EAIDSPVSFL<b>V</b>LHNQIR | + |


### Galaxy Workflow [⤴](#table-of-contents)

![viewer](./graphics/workflow.png)

Galaxy workflows are tailored pipelines that promote reproducibility, ease-of-use, and preservation of complex analyses. Two workflows, both with differing complexities, are shown above. The simple workflow (top left panel) was used for the paper and Docker image to redirect focus to the downstream analysis i.e., CRAVAT-P's outputs and viewer. A fully-fledged workflow (bottom panel) is shown as an example of a highly complex workflow. The top right panel shows how workflows can automate parameter selection and offer additional options such as e-mail notification and output cleanup.

### Galaxy Viewer Plugin [⤴](#table-of-contents)

Galaxy uses JavaScript-based visualization plugins to interactively explore your data.

*Panel A shows the actual viewer, with panels B - E as blown-up images for further detail.*

**(A-i)** Sidebar for showing additional information, mainly column visibility toggling. There are many columns to sift through > from CRAVAT's annotation.

<b>(A-ii)</b> An embedded webpage from the CRAVAT server termed their "Single Variants Page" feature.

<b>(B)</b> Leveraging the DataTable.js library, this table can be sorted and filtered. By default, it is sorted by p-values (based on the machine learning analysis i.e., VEST or CHASM) from most impactful to least. The selected box exhibits a peptide column that highlights the variant amino acid within a peptide hit. Since some cells may have large amounts of text, the full datum is shown in the display box at the top.

![viewer](./graphics/viewer.png)

<b>(C)</b> CRAVAT uses Protein Diagrams to show lollipop mutations from your given protein variant. You can also choose TCGA (The Cancer Genome Atlas) tissue mutations. You can mouse over different parts to show domains, binding sites, and other regions of interest.

<b>(D)</b> CRAVAT uses the cytoscape.js library to display gene enrichment networks housed by the NDEx (Network Data Exchange) infrastructure. You can move elements around and examine different pathways.

<b>(E)</b> CRAVAT uses another project developed by the same lab (Professor Rachel Karchin's lab) called MuPIT (Mutation Position Imaging Toolbox) designed to show the location of single nucleotide variants (SNVs) on interactive three-dimensional protein structures. You can click on individual residues and adjust the display options.

---

# CRAVAT-P Tutorial [⤴](#table-of-contents)


<p align="center"> <b>Overview</b> </p>
<p align="center"> Import the input files → Run the workflow →  Access the viewer</p>


## 1.) **Import the input files** from the data library [⤴](#table-of-contents)

<a target="_blank" href="http://localhost:8080"><img src="./graphics/input-files.gif" alt="step-1"/></a>

- click **Shared Data** > **Data Libraries**
- open **Training Data** > **Input files for CRAVAT-P Demo**
- check the checkbox in the header to select both input files
- click **to History**
- *optional: name your new history (e.g., mcf7_cancer_proteogenomics)*
- click import
- click on the green pop-up window to go back to the homepage to analyze these datasets.

## 2.) Log in and **run the workflow** [⤴](#table-of-contents)

<a href="http://localhost:8080"><img src="./graphics/workflow.gif" alt="step-2"/></a>

- The CRAVAT-P workflow was placed into an administrative account through Docker. To access it, click **Login or Register** > **Login** and log in using the following credentials:
	+ **Username:** admin@galaxy.org
	+ **Password:** admin
- click **Workflow** to show the list of workflows in this account. *In this case, we only have the **CRAVAT Workflow***
- click on the **CRAVAT Workflow** button and click **Run** from the resulting dropdown
- click **Run workflow**. The  analysis will start and will finish in a couple of minutes. *This workflow was set to include proteogenomic input and automatically select the correct input file types (VCF and proBED) in the history.*

## 3.) **Access the viewer** [⤴](#table-of-contents)

<a href="http://localhost:8080"><img src="./graphics/viewer.gif" alt="step-3"/></a>

- *Once the VCF output turns green (signifying completion), you can access the visualizer.* Open the dataset collection, and click on any of the four datasets to expand it. The **variant** dataset is preferred, since it typically contains the most useful information. *In the viewer, you will be able to access all the datasets anyway.*
- Click the "visualize" icon and select **CRAVAT Viewer**.

---
