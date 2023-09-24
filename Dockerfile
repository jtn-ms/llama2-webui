FROM python:3.10.11

RUN pip install accelerate==0.21.0 \
                auto-gptq==0.3.0\
                bitsandbytes==0.40.2\
                gradio==3.37.0\
                protobuf==3.20.3\
                scipy==1.11.1\
                sentencepiece==0.1.99\
                torch==2.0.1\
                transformers==4.31.0\
                tqdm==4.65.0\
                python-dotenv==1.0.0\
                llama-cpp-python==0.1.77\
                memory-profiler==0.61.0\
                huggingface-hub==0.16.4\
                fastapi==0.100.0\
                uvicorn==0.23.1\
                sse-starlette==1.6.5\
                pydantic==2.2.1\
                pydantic-settings==2.0.3\
                pytest==7.4.0\
                black==23.7.0

# Download latest github/llama2-webui in llama2-webui directory
RUN mkdir /app
RUN git clone https://github.com/jtn-ms/llama2-webui.git /app/llama2-webui

# Create the /models directory in the container
RUN mkdir /models

# ADD PATH TO YOUR MODEL:
#COPY ./llama-2-13b-chat.ggmlv3.q2_K.bin ~

# http exposition
# http://127.0.0.1:7860/

EXPOSE 7680
#RUN python3 app.py

WORKDIR /app/llama2-webui
CMD ["python", "app.py"]
