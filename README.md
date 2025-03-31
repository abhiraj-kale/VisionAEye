# VisionAEye: Mobile App for the Visually Impaired

## Overview
VisionAEye is a mobile application designed to enhance the daily lives of visually impaired individuals by leveraging advanced technologies such as image recognition, text-to-speech, and voice search. The app aims to provide greater independence and accessibility, allowing users to navigate their surroundings with ease.

## Key Features
- **Advanced Image Recognition**: Utilizes sophisticated algorithms based on machine learning models to identify objects, people, and text in real-time
- **Text-to-Speech Technology**: Converts recognized textual information into spoken words, providing auditory feedback
- **Voice Search Functionality**: Enables voice-activated commands for seamless interaction with the app
- **Cash Note Recognition**: Identifies Indian currency notes (₹10, ₹20, ₹50, ₹100, ₹200, ₹500, ₹2000)
- **SOS Feature**: Built-in safety mechanism for emergency situations
- **OCR Integration**: Uses Tesseract OCR in Flutter for text detection capabilities

## Technical Implementation
- Comparative analysis between YOLO v3 and SSD MobileNet v2 for object detection
- YOLO v3 showed better overall accuracy (72.70%) and recall (74%)
- SSD MobileNet v2 demonstrated higher precision (88.98%)
- Darknet-53 backbone network structure for YOLO v3
- VGG-16 backbone for SSD with modified architecture

## Performance Metrics
| Metric | YOLO v3 | SSD MobileNet v2 |
|--------|---------|-----------------|
| Accuracy | 72.70% | 59.70% |
| Precision | 86% | 88.98% |
| Recall | 74% | 62.84% |
| F1-Score | 79% | 73.66% |

## Dataset
- Common Objects in Context (COCO) dataset with 91 labels for general object detection
- Custom dataset for Indian currency notes recognition
  
## Screenshots
![home](https://github.com/user-attachments/assets/42ffb1b8-65c8-44f1-a00a-e1852c1fe13d)

![detect](https://github.com/user-attachments/assets/ceb15b54-2019-480f-97e1-174d03238e99)

![text](https://github.com/user-attachments/assets/14016428-28c0-434d-b459-f9edff86c2d4)

![object'](https://github.com/user-attachments/assets/22da3277-7483-40cd-b7b2-4bc5c9ecf5fe)

## Development Team
- Abhiraj Kale (abhiraj.kale@somaiya.edu)
- Aamir Baugwala (aamir.baugwala@somaiya.edu)
- Akash Shetgar (akash.shetgar@somaiya.edu)
- Dr. Deepak Sharma (deepaksharma@somaiya.edu)

## Future Enhancements
- Continuous innovation based on user feedback
- Regular updates to improve accuracy and performance
- Expansion of detectable objects and currencies

## Vision
VisionAEye represents a paradigm shift in assistive technology, demonstrating the transformative power of empathy, innovation, and a shared vision for a more accessible and inclusive world.
