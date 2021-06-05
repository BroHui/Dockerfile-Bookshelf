FROM jupyter/base-notebook
# Create a Python 2.x environment using conda including at least the ipython kernel
# and the kernda utility. Add any additional packages you want available for use
# in a Python 2 notebook to the first line here (e.g., pandas, matplotlib, etc.)
RUN conda create --quiet --yes -p $CONDA_DIR/envs/python2 python=2.7 ipython ipykernel kernda && \
    conda clean --all -f -y
USER root
# Create a global kernelspec in the image and modify it so that it properly activates
# the python2 conda environment.
RUN $CONDA_DIR/envs/python2/bin/python -m ipykernel install && \
$CONDA_DIR/envs/python2/bin/kernda -o -y /usr/local/share/jupyter/kernels/python2/kernel.json

# All requirements
RUN pip3 install --quiet --no-cache-dir jupyter_contrib_nbextensions jupyter_nbextensions_configurator && \
    jupyter contrib nbextension install --system && \
    jupyter nbextensions_configurator enable --system && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER $NB_USER
# Calc requiremetns and so on.
RUN pip3 install --quiet --no-cache-dir pandas matplotlib
