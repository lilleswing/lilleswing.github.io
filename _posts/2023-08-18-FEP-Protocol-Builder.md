---
layout: page 
title: Introducing FEP Protocol Builder
---

# FEP Protocol Builder

{:style="text-align:center;"}
![FEP_PB](/assets/2023_08_18/fep_pb_workflow.png)


Free energy perturbation (FEP) calculations are a powerful tool for predicting the binding affinity of small molecules to proteins and other drug targets.
However, developing accurate FEP protocols can be challenging and time-consuming, especially for complex systems.

Traditional FEP protocol development requires manual exploration of a large parameter space.
Additionally, it can be difficult to determine which parameters have the greatest impact on FEP performance, resulting in overfitting.

FEP Protocol Builder (FEP-PB) is an automated workflow that uses active learning to rapidly generate accurate FEP protocols.
FEP-PB iteratively selects the most informative protocol parameter settings to test, based on the results of previous calculations.
This approach allows FEP-PB to quickly identify a set of parameter settings that produce accurate FEP results, with minimal human intervention.

To validate FEP-PB, we applied it to a variety of pharmaceutically relevant systems, including the previously challenging MCL1 system.
FEP-PB was able to rapidly generate accurate FEP protocols for all the systems tested, with minimal human intervention.

In a real-world drug discovery setting, FEP-PB was used to generate an accurate FEP protocol for the p97 system.
FEP-PB was able to generate a more accurate protocol than the expert user, rapidly validating p97 as amenable to free energy calculations.

FEP-PB is a powerful new tool that can help researchers to rapidly develop accurate FEP protocols for a wide range of systems.
This could lead to the discovery of new drugs more quickly and efficiently.


Check out the full work [here](https://pubs.acs.org/doi/10.1021/acs.jcim.3c00681)