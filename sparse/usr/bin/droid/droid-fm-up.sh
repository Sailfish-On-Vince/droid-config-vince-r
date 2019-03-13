#!/bin/sh

chmod a+w /sys/module/radio_iris_transport/parameters/fmsmd_set
/system/bin/fm_qsoc_patches 199217 0
