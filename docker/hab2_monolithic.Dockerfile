FROM fairembodied/habitat-challenge:habitat_rearrangement_2022_base_docker
ADD agents/habitat_baselines_agent.py agent.py
ADD configs/ /configs/
ADD scripts/submission.sh submission.sh
ADD ddppo_rearrange_habitat2022_challenge_baseline_v1.pth demo.ckpt.pth
ENV AGENT_EVALUATION_TYPE remote

ENV TRACK_CONFIG_FILE "/configs/tasks/rearrange.local.rgbd.yaml"

RUN /bin/bash -c ". activate habitat; pip install ifcfg torchvision tensorboard"
CMD ["/bin/bash", "-c", "source activate habitat && export PYTHONPATH=/evalai-remote-evaluation:$PYTHONPATH && export CHALLENGE_CONFIG_FILE=$TRACK_CONFIG_FILE && bash submission.sh --model-path demo.ckpt.pth --input-type rgbd"]

