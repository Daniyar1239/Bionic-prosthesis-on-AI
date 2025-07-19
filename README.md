# Bionic-prosthesis-on-AI
Real-time EMG signal classification for the bionic prosthesis design

The final demonstration of the project is shown in the following link: [https://drive.google.com/file/d/1NqWnGPf58lklonyfdcCDBk1DoelbOwiD/view](https://drive.google.com/file/d/11BmLYQOamogmtogGr1IiWoeqCmg4kxBr/view?usp=sharing).

The code is written to classify 5 hand gestures + rest position using the Support Vector Machine (SVM) classifier based on the time-domain (TD) features extracted from the denoised EMG signals. The EMG signals have been recorded using 5 muscle sensors with gelled pads all connected to the Arduino Uno board for transmission of signals to the laptop.

The SVM model has been first trained in 8+ sessions, where in each session there were 10 repetitions for each of the gesture. Lastly, the real-time prediction is run using the buffer of 32 samples. 

Feel free to ask any further questions by writing to my email: daniyar.zhakyp@nu.edu.kz
