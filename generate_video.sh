#!/bin/bash
set -e

# =============================================================================
# WORLD MODELS — Explainer Video Generator
# Generates a motion graphics video using pure FFMPEG
# =============================================================================

OUTPUT_DIR="/home/user/world-model/output"
SCENES_DIR="$OUTPUT_DIR/scenes"
FINAL_VIDEO="$OUTPUT_DIR/world_models_explainer.mp4"

mkdir -p "$SCENES_DIR"

# Video settings
W=1920
H=1080
FPS=30
FB="/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf"
FR="/usr/share/fonts/truetype/liberation/LiberationSans-Regular.ttf"

# Colors
WHITE="white"
GRAY="#aaaaaa"
LG="#cccccc"

echo "=== Generating Scene 1: Title ==="
ffmpeg -y -f lavfi -i "color=c=#0a0a1a:s=${W}x${H}:d=6,format=yuv420p" \
  -vf "
    drawbox=x=0:y=0:w=iw:h=4:color=#6c3483@0.9:t=fill:enable='gte(t,0.3)',
    drawbox=x=0:y=ih-4:w=iw:h=4:color=#3498db@0.9:t=fill:enable='gte(t,0.3)',
    drawtext=text='WORLD':fontfile=${FB}:fontsize=140:fontcolor=white:x=(w-tw)/2-200:y=(h-th)/2-100:alpha='min(1,t/0.8)',
    drawtext=text='MODELS':fontfile=${FB}:fontsize=140:fontcolor=#6c3483:x=(w-tw)/2+180:y=(h-th)/2-100:alpha='if(lt(t,0.8),0,min(1,(t-0.8)/0.8))',
    drawbox=x=610:y=550:w=700:h=3:color=#3498db:t=fill:enable='gte(t,1.5)',
    drawtext=text='5 approches pour apprendre aux machines':fontfile=${FR}:fontsize=36:fontcolor=#cccccc:x=(w-tw)/2:y=(h/2)+50:alpha='if(lt(t,2),0,min(1,(t-2)/0.8))',
    drawtext=text='a comprendre la realite':fontfile=${FR}:fontsize=36:fontcolor=#cccccc:x=(w-tw)/2:y=(h/2)+100:alpha='if(lt(t,2.3),0,min(1,(t-2.3)/0.8))'
  " \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/01_title.mp4"

echo "=== Generating Scene 2: The Problem ==="
ffmpeg -y -f lavfi -i "color=c=#0d1b2a:s=${W}x${H}:d=8,format=yuv420p" \
  -vf "
    drawbox=x=0:y=0:w=iw:h=6:color=#e74c3c@0.8:t=fill,
    drawtext=text='LE PROBLEME':fontfile=${FB}:fontsize=72:fontcolor=#e74c3c:x=(w-tw)/2:y=120:alpha='min(1,t/0.5)',
    drawbox=x=710:y=210:w=500:h=2:color=#e74c3c@0.6:t=fill:enable='gte(t,0.5)',
    drawtext=text='Les IA actuelles ne comprennent pas':fontfile=${FR}:fontsize=42:fontcolor=white:x=(w-tw)/2:y=280:alpha='if(lt(t,1),0,min(1,(t-1)/0.6))',
    drawtext=text='le monde physique.':fontfile=${FB}:fontsize=42:fontcolor=white:x=(w-tw)/2:y=340:alpha='if(lt(t,1.3),0,min(1,(t-1.3)/0.6))',
    drawbox=x=300:y=440:w=40:h=40:color=#e74c3c@0.7:t=fill:enable='gte(t,2.5)',
    drawtext=text='Un verre lache va tomber':fontfile=${FR}:fontsize=32:fontcolor=#aaaaaa:x=360:y=445:alpha='if(lt(t,2.5),0,min(1,(t-2.5)/0.5))',
    drawbox=x=300:y=510:w=40:h=40:color=#e74c3c@0.7:t=fill:enable='gte(t,3.2)',
    drawtext=text='Une porte doit etre poussee pour s ouvrir':fontfile=${FR}:fontsize=32:fontcolor=#aaaaaa:x=360:y=515:alpha='if(lt(t,3.2),0,min(1,(t-3.2)/0.5))',
    drawbox=x=300:y=580:w=40:h=40:color=#e74c3c@0.7:t=fill:enable='gte(t,3.9)',
    drawtext=text='Un objet cache continue d exister':fontfile=${FR}:fontsize=32:fontcolor=#aaaaaa:x=360:y=585:alpha='if(lt(t,3.9),0,min(1,(t-3.9)/0.5))',
    drawbox=x=510:y=700:w=900:h=80:color=#1a1a3a@0.8:t=fill:enable='gte(t,5)',
    drawtext=text='Un enfant de 2 ans le sait.  Pas GPT, Gemini ou Claude.':fontfile=${FB}:fontsize=34:fontcolor=#e74c3c:x=(w-tw)/2:y=720:alpha='if(lt(t,5),0,min(1,(t-5)/0.5))'
  " \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/02_problem.mp4"

echo "=== Generating Scene 3: The Billions ==="
ffmpeg -y -f lavfi -i "color=c=#0a0a1a:s=${W}x${H}:d=7,format=yuv420p" \
  -vf "
    drawtext=text='LA COURSE AUX MILLIARDS':fontfile=${FB}:fontsize=60:fontcolor=#f1c40f:x=(w-tw)/2:y=100:alpha='min(1,t/0.5)',
    drawbox=x=660:y=180:w=600:h=2:color=#f1c40f@0.6:t=fill:enable='gte(t,0.5)',
    drawbox=x=200:y=280:w=700:h=160:color=#1a0a3a@0.7:t=fill:enable='gte(t,1)',
    drawtext=text='AMI Labs':fontfile=${FB}:fontsize=48:fontcolor=white:x=240:y=300:alpha='if(lt(t,1.2),0,min(1,(t-1.2)/0.5))',
    drawtext=text='Yann LeCun':fontfile=${FR}:fontsize=28:fontcolor=#aaaaaa:x=240:y=360:alpha='if(lt(t,1.5),0,min(1,(t-1.5)/0.5))',
    drawtext=text='1,03 Md\$':fontfile=${FB}:fontsize=56:fontcolor=#f1c40f:x=680:y=310:alpha='if(lt(t,2),0,min(1,(t-2)/0.5))',
    drawbox=x=200:y=500:w=700:h=160:color=#0a2a3a@0.7:t=fill:enable='gte(t,2.5)',
    drawtext=text='World Labs':fontfile=${FB}:fontsize=48:fontcolor=white:x=240:y=520:alpha='if(lt(t,2.8),0,min(1,(t-2.8)/0.5))',
    drawtext=text='Fei-Fei Li':fontfile=${FR}:fontsize=28:fontcolor=#aaaaaa:x=240:y=580:alpha='if(lt(t,3.1),0,min(1,(t-3.1)/0.5))',
    drawtext=text='1 Md\$':fontfile=${FB}:fontsize=56:fontcolor=#f1c40f:x=700:y=530:alpha='if(lt(t,3.5),0,min(1,(t-3.5)/0.5))',
    drawtext=text='Mars 2026':fontfile=${FR}:fontsize=24:fontcolor=#aaaaaa:x=(w-tw)/2:y=740:alpha='if(lt(t,4.5),0,min(1,(t-4.5)/0.5))'
  " \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/03_billions.mp4"

echo "=== Generating Scene 4: JEPA ==="
ffmpeg -y -f lavfi -i "color=c=#1a0a3a:s=${W}x${H}:d=10,format=yuv420p" \
  -vf "
    drawbox=x=0:y=0:w=8:h=ih:color=#9b59b6:t=fill,
    drawbox=x=0:y=0:w=iw:h=4:color=#9b59b6@0.6:t=fill,
    drawtext=text='01':fontfile=${FB}:fontsize=200:fontcolor=#9b59b6@0.15:x=w-350:y=50,
    drawtext=text='JEPA':fontfile=${FB}:fontsize=80:fontcolor=white:x=80:y=80:alpha='min(1,t/0.4)',
    drawtext=text='Predire le sens, pas les pixels':fontfile=${FR}:fontsize=36:fontcolor=#9b59b6:x=80:y=180:alpha='if(lt(t,0.5),0,min(1,(t-0.5)/0.5))',
    drawtext=text='AMI Labs  |  Yann LeCun  |  Meta AI':fontfile=${FR}:fontsize=24:fontcolor=#aaaaaa:x=80:y=240:alpha='if(lt(t,0.8),0,min(1,(t-0.8)/0.5))',
    drawbox=x=80:y=300:w=800:h=2:color=#9b59b6@0.4:t=fill:enable='gte(t,1.2)',
    drawbox=x=80:y=360:w=20:h=20:color=#9b59b6@0.8:t=fill:enable='gte(t,2)',
    drawtext=text='Apprend dans un espace LATENT abstrait':fontfile=${FR}:fontsize=32:fontcolor=white:x=120:y=358:alpha='if(lt(t,2),0,min(1,(t-2)/0.5))',
    drawtext=text='(pas pixel par pixel)':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=120:y=398:alpha='if(lt(t,2.3),0,min(1,(t-2.3)/0.5))',
    drawbox=x=80:y=460:w=20:h=20:color=#9b59b6@0.8:t=fill:enable='gte(t,3.5)',
    drawtext=text='Apprentissage AUTO-SUPERVISE':fontfile=${FR}:fontsize=32:fontcolor=white:x=120:y=458:alpha='if(lt(t,3.5),0,min(1,(t-3.5)/0.5))',
    drawtext=text='1 million d heures de video, zero etiquetage':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=120:y=498:alpha='if(lt(t,3.8),0,min(1,(t-3.8)/0.5))',
    drawbox=x=80:y=560:w=20:h=20:color=#9b59b6@0.8:t=fill:enable='gte(t,5)',
    drawtext=text='62 heures de video robot suffisent':fontfile=${FR}:fontsize=32:fontcolor=white:x=120:y=558:alpha='if(lt(t,5),0,min(1,(t-5)/0.5))',
    drawtext=text='pour planifier des taches inedites':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=120:y=598:alpha='if(lt(t,5.3),0,min(1,(t-5.3)/0.5))',
    drawbox=x=1420:y=700:w=420:h=100:color=#0a0a2a@0.6:t=fill:enable='gte(t,7)',
    drawtext=text='V-JEPA 2  arXiv 2506.09985':fontfile=${FR}:fontsize=22:fontcolor=#aaaaaa:x=w-480:y=735:alpha='if(lt(t,7),0,min(1,(t-7)/0.5))'
  " \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/04_jepa.mp4"

echo "=== Generating Scene 5: Spatial Intelligence ==="
ffmpeg -y -f lavfi -i "color=c=#0a2a3a:s=${W}x${H}:d=10,format=yuv420p" \
  -vf "
    drawbox=x=0:y=0:w=8:h=ih:color=#3498db:t=fill,
    drawbox=x=0:y=0:w=iw:h=4:color=#3498db@0.6:t=fill,
    drawtext=text='02':fontfile=${FB}:fontsize=200:fontcolor=#3498db@0.15:x=w-350:y=50,
    drawtext=text='INTELLIGENCE SPATIALE':fontfile=${FB}:fontsize=70:fontcolor=white:x=80:y=80:alpha='min(1,t/0.4)',
    drawtext=text='Reconstruire le monde en 3D':fontfile=${FR}:fontsize=36:fontcolor=#3498db:x=80:y=170:alpha='if(lt(t,0.5),0,min(1,(t-0.5)/0.5))',
    drawtext=text='World Labs  |  Fei-Fei Li  |  Stanford':fontfile=${FR}:fontsize=24:fontcolor=#aaaaaa:x=80:y=230:alpha='if(lt(t,0.8),0,min(1,(t-0.8)/0.5))',
    drawbox=x=80:y=290:w=800:h=2:color=#3498db@0.4:t=fill:enable='gte(t,1.2)',
    drawbox=x=80:y=360:w=20:h=20:color=#3498db@0.8:t=fill:enable='gte(t,2)',
    drawtext=text='Produit MARBLE \: scenes 3D completes':fontfile=${FR}:fontsize=32:fontcolor=white:x=120:y=358:alpha='if(lt(t,2),0,min(1,(t-2)/0.5))',
    drawtext=text='a partir d une photo, d un texte ou d une esquisse':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=120:y=398:alpha='if(lt(t,2.3),0,min(1,(t-2.3)/0.5))',
    drawbox=x=80:y=460:w=20:h=20:color=#3498db@0.8:t=fill:enable='gte(t,3.5)',
    drawtext=text='Pas une video \: un MONDE navigable':fontfile=${FR}:fontsize=32:fontcolor=white:x=120:y=458:alpha='if(lt(t,3.5),0,min(1,(t-3.5)/0.5))',
    drawtext=text='Camera libre, objets editables, export 3D':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=120:y=498:alpha='if(lt(t,3.8),0,min(1,(t-3.8)/0.5))',
    drawbox=x=80:y=560:w=20:h=20:color=#3498db@0.8:t=fill:enable='gte(t,5)',
    drawtext=text='Herite de NeRFs et 3D Gaussian Splatting':fontfile=${FR}:fontsize=32:fontcolor=white:x=120:y=558:alpha='if(lt(t,5),0,min(1,(t-5)/0.5))',
    drawtext=text='mais GENERE des scenes, ne les reconstruit pas':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=120:y=598:alpha='if(lt(t,5.3),0,min(1,(t-5.3)/0.5))'
  " \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/05_spatial.mp4"

echo "=== Generating Scene 6: Learned Simulation ==="
ffmpeg -y -f lavfi -i "color=c=#0a2a1a:s=${W}x${H}:d=12,format=yuv420p" \
  -vf "
    drawbox=x=0:y=0:w=8:h=ih:color=#2ecc71:t=fill,
    drawbox=x=0:y=0:w=iw:h=4:color=#2ecc71@0.6:t=fill,
    drawtext=text='03':fontfile=${FB}:fontsize=200:fontcolor=#2ecc71@0.15:x=w-350:y=50,
    drawtext=text='SIMULATION APPRISE':fontfile=${FB}:fontsize=76:fontcolor=white:x=80:y=80:alpha='min(1,t/0.4)',
    drawtext=text='Rever pour apprendre':fontfile=${FR}:fontsize=36:fontcolor=#2ecc71:x=80:y=175:alpha='if(lt(t,0.5),0,min(1,(t-0.5)/0.5))',
    drawtext=text='Google DeepMind  |  Runway':fontfile=${FR}:fontsize=24:fontcolor=#aaaaaa:x=80:y=235:alpha='if(lt(t,0.8),0,min(1,(t-0.8)/0.5))',
    drawbox=x=80:y=295:w=800:h=2:color=#2ecc71@0.4:t=fill:enable='gte(t,1.2)',
    drawtext=text='DEUX COURANTS QUI CONVERGENT':fontfile=${FB}:fontsize=28:fontcolor=#2ecc71:x=80:y=330:alpha='if(lt(t,1.5),0,min(1,(t-1.5)/0.5))',
    drawbox=x=80:y=390:w=840:h=140:color=#0a1a0a@0.6:t=fill:enable='gte(t,2.5)',
    drawtext=text='Genie 3 \: Generation video interactive':fontfile=${FB}:fontsize=30:fontcolor=white:x=100:y=400:alpha='if(lt(t,2.5),0,min(1,(t-2.5)/0.5))',
    drawtext=text='Environnements navigables a 24 fps':fontfile=${FR}:fontsize=24:fontcolor=#aaaaaa:x=100:y=440:alpha='if(lt(t,2.8),0,min(1,(t-2.8)/0.5))',
    drawtext=text='Coherence ~1 minute':fontfile=${FR}:fontsize=24:fontcolor=#aaaaaa:x=100:y=475:alpha='if(lt(t,3.1),0,min(1,(t-3.1)/0.5))',
    drawbox=x=80:y=560:w=840:h=170:color=#0a1a0a@0.6:t=fill:enable='gte(t,5)',
    drawtext=text='Dreamer V4 \: Apprentissage par imagination':fontfile=${FB}:fontsize=30:fontcolor=white:x=100:y=570:alpha='if(lt(t,5),0,min(1,(t-5)/0.5))',
    drawtext=text='Diamants Minecraft obtenus en REVANT':fontfile=${FR}:fontsize=24:fontcolor=#2ecc71:x=100:y=615:alpha='if(lt(t,5.5),0,min(1,(t-5.5)/0.5))',
    drawtext=text='100%% offline \: jamais interagi avec le jeu':fontfile=${FR}:fontsize=24:fontcolor=#aaaaaa:x=100:y=655:alpha='if(lt(t,5.8),0,min(1,(t-5.8)/0.5))',
    drawtext=text='Temps reel sur un seul GPU':fontfile=${FR}:fontsize=24:fontcolor=#aaaaaa:x=100:y=690:alpha='if(lt(t,6.1),0,min(1,(t-6.1)/0.5))'
  " \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/06_simulation.mp4"

echo "=== Generating Scene 7: NVIDIA Cosmos ==="
ffmpeg -y -f lavfi -i "color=c=#1a2a0a:s=${W}x${H}:d=10,format=yuv420p" \
  -vf "
    drawbox=x=0:y=0:w=8:h=ih:color=#76b900:t=fill,
    drawbox=x=0:y=0:w=iw:h=4:color=#76b900@0.6:t=fill,
    drawtext=text='04':fontfile=${FB}:fontsize=200:fontcolor=#76b900@0.15:x=w-350:y=50,
    drawtext=text='NVIDIA COSMOS':fontfile=${FB}:fontsize=80:fontcolor=white:x=80:y=80:alpha='min(1,t/0.4)',
    drawtext=text='L infrastructure pour tous':fontfile=${FR}:fontsize=36:fontcolor=#76b900:x=80:y=180:alpha='if(lt(t,0.5),0,min(1,(t-0.5)/0.5))',
    drawtext=text='Vendre les pioches pendant la ruee vers l or':fontfile=${FR}:fontsize=24:fontcolor=#aaaaaa:x=80:y=240:alpha='if(lt(t,0.8),0,min(1,(t-0.8)/0.5))',
    drawbox=x=80:y=300:w=800:h=2:color=#76b900@0.4:t=fill:enable='gte(t,1.2)',
    drawbox=x=80:y=350:w=550:h=90:color=#1a2a0a@0.8:t=fill:enable='gte(t,2)',
    drawtext=text='20 MILLIONS d heures de video':fontfile=${FB}:fontsize=34:fontcolor=#76b900:x=100:y=360:alpha='if(lt(t,2),0,min(1,(t-2)/0.5))',
    drawtext=text='traitees en 14 jours':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=100:y=400:alpha='if(lt(t,2.3),0,min(1,(t-2.3)/0.5))',
    drawbox=x=80:y=470:w=550:h=90:color=#1a2a0a@0.8:t=fill:enable='gte(t,3.5)',
    drawtext=text='Tokenizer visuel 8x plus efficace':fontfile=${FB}:fontsize=34:fontcolor=#76b900:x=100:y=480:alpha='if(lt(t,3.5),0,min(1,(t-3.5)/0.5))',
    drawtext=text='que l etat de l art precedent':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=100:y=520:alpha='if(lt(t,3.8),0,min(1,(t-3.8)/0.5))',
    drawbox=x=80:y=590:w=550:h=90:color=#1a2a0a@0.8:t=fill:enable='gte(t,5)',
    drawtext=text='9 000 milliards de tokens':fontfile=${FB}:fontsize=34:fontcolor=#76b900:x=100:y=600:alpha='if(lt(t,5),0,min(1,(t-5)/0.5))',
    drawtext=text='Predict | Transfer | Reason':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=100:y=640:alpha='if(lt(t,5.3),0,min(1,(t-5.3)/0.5))'
  " \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/07_nvidia.mp4"

echo "=== Generating Scene 8: Active Inference ==="
ffmpeg -y -f lavfi -i "color=c=#2a1a0a:s=${W}x${H}:d=10,format=yuv420p" \
  -vf "
    drawbox=x=0:y=0:w=8:h=ih:color=#e67e22:t=fill,
    drawbox=x=0:y=0:w=iw:h=4:color=#e67e22@0.6:t=fill,
    drawtext=text='05':fontfile=${FB}:fontsize=200:fontcolor=#e67e22@0.15:x=w-350:y=50,
    drawtext=text='INFERENCE ACTIVE':fontfile=${FB}:fontsize=80:fontcolor=white:x=80:y=80:alpha='min(1,t/0.4)',
    drawtext=text='Minimiser la surprise':fontfile=${FR}:fontsize=36:fontcolor=#e67e22:x=80:y=180:alpha='if(lt(t,0.5),0,min(1,(t-0.5)/0.5))',
    drawtext=text='VERSES AI  |  Karl Friston  |  Neurosciences':fontfile=${FR}:fontsize=24:fontcolor=#aaaaaa:x=80:y=240:alpha='if(lt(t,0.8),0,min(1,(t-0.8)/0.5))',
    drawbox=x=80:y=300:w=800:h=2:color=#e67e22@0.4:t=fill:enable='gte(t,1.2)',
    drawbox=x=80:y=360:w=20:h=20:color=#e67e22@0.8:t=fill:enable='gte(t,2)',
    drawtext=text='PAS de reseaux de neurones profonds':fontfile=${FR}:fontsize=32:fontcolor=white:x=120:y=358:alpha='if(lt(t,2),0,min(1,(t-2)/0.5))',
    drawtext=text='Inference bayesienne + modele structure':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=120:y=398:alpha='if(lt(t,2.3),0,min(1,(t-2.3)/0.5))',
    drawbox=x=80:y=460:w=20:h=20:color=#e67e22@0.8:t=fill:enable='gte(t,3.5)',
    drawtext=text='Principe de l Energie Libre':fontfile=${FR}:fontsize=32:fontcolor=white:x=120:y=458:alpha='if(lt(t,3.5),0,min(1,(t-3.5)/0.5))',
    drawtext=text='L intelligence = minimiser la surprise':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=120:y=498:alpha='if(lt(t,3.8),0,min(1,(t-3.8)/0.5))',
    drawbox=x=80:y=560:w=20:h=20:color=#e67e22@0.8:t=fill:enable='gte(t,5)',
    drawtext=text='Interpretable, compositionnel, econome':fontfile=${FR}:fontsize=32:fontcolor=white:x=120:y=558:alpha='if(lt(t,5),0,min(1,(t-5)/0.5))',
    drawtext=text='AXIOM + produit Genius (avril 2025)':fontfile=${FR}:fontsize=26:fontcolor=#aaaaaa:x=120:y=598:alpha='if(lt(t,5.3),0,min(1,(t-5.3)/0.5))'
  " \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/08_active.mp4"

echo "=== Generating Scene 9: Synthesis ==="
ffmpeg -y -f lavfi -i "color=c=#0a0a2a:s=${W}x${H}:d=10,format=yuv420p" \
  -vf "
    drawtext=text='SYNTHESE':fontfile=${FB}:fontsize=72:fontcolor=white:x=(w-tw)/2:y=60:alpha='min(1,t/0.5)',
    drawbox=x=760:y=150:w=400:h=2:color=white@0.4:t=fill:enable='gte(t,0.5)',
    drawbox=x=100:y=220:w=300:h=500:color=#9b59b6@0.25:t=fill:enable='gte(t,1.5)',
    drawtext=text='JEPA':fontfile=${FB}:fontsize=28:fontcolor=white:x=185:y=240:alpha='if(lt(t,1.5),0,min(1,(t-1.5)/0.5))',
    drawtext=text='Comprendre':fontfile=${FR}:fontsize=20:fontcolor=#cccccc:x=180:y=280:alpha='if(lt(t,2),0,min(1,(t-2)/0.5))',
    drawtext=text='sans pixels':fontfile=${FR}:fontsize=20:fontcolor=#cccccc:x=185:y=310:alpha='if(lt(t,2),0,min(1,(t-2)/0.5))',
    drawbox=x=440:y=220:w=300:h=500:color=#3498db@0.25:t=fill:enable='gte(t,2)',
    drawtext=text='SPATIAL':fontfile=${FB}:fontsize=28:fontcolor=white:x=530:y=240:alpha='if(lt(t,2),0,min(1,(t-2)/0.5))',
    drawtext=text='Reconstruire':fontfile=${FR}:fontsize=20:fontcolor=#cccccc:x=522:y=280:alpha='if(lt(t,2.5),0,min(1,(t-2.5)/0.5))',
    drawtext=text='en 3D':fontfile=${FR}:fontsize=20:fontcolor=#cccccc:x=555:y=310:alpha='if(lt(t,2.5),0,min(1,(t-2.5)/0.5))',
    drawbox=x=780:y=220:w=300:h=500:color=#2ecc71@0.25:t=fill:enable='gte(t,2.5)',
    drawtext=text='SIMULATION':fontfile=${FB}:fontsize=28:fontcolor=white:x=845:y=240:alpha='if(lt(t,2.5),0,min(1,(t-2.5)/0.5))',
    drawtext=text='Rever pour':fontfile=${FR}:fontsize=20:fontcolor=#cccccc:x=873:y=280:alpha='if(lt(t,3),0,min(1,(t-3)/0.5))',
    drawtext=text='apprendre':fontfile=${FR}:fontsize=20:fontcolor=#cccccc:x=878:y=310:alpha='if(lt(t,3),0,min(1,(t-3)/0.5))',
    drawbox=x=1120:y=220:w=300:h=500:color=#76b900@0.25:t=fill:enable='gte(t,3)',
    drawtext=text='NVIDIA':fontfile=${FB}:fontsize=28:fontcolor=white:x=1210:y=240:alpha='if(lt(t,3),0,min(1,(t-3)/0.5))',
    drawtext=text='Infrastructure':fontfile=${FR}:fontsize=20:fontcolor=#cccccc:x=1200:y=280:alpha='if(lt(t,3.5),0,min(1,(t-3.5)/0.5))',
    drawtext=text='pour tous':fontfile=${FR}:fontsize=20:fontcolor=#cccccc:x=1225:y=310:alpha='if(lt(t,3.5),0,min(1,(t-3.5)/0.5))',
    drawbox=x=1460:y=220:w=300:h=500:color=#e67e22@0.25:t=fill:enable='gte(t,3.5)',
    drawtext=text='INFERENCE':fontfile=${FB}:fontsize=28:fontcolor=white:x=1535:y=240:alpha='if(lt(t,3.5),0,min(1,(t-3.5)/0.5))',
    drawtext=text='Minimiser':fontfile=${FR}:fontsize=20:fontcolor=#cccccc:x=1555:y=280:alpha='if(lt(t,4),0,min(1,(t-4)/0.5))',
    drawtext=text='la surprise':fontfile=${FR}:fontsize=20:fontcolor=#cccccc:x=1545:y=310:alpha='if(lt(t,4),0,min(1,(t-4)/0.5))',
    drawbox=x=410:y=800:w=1100:h=80:color=#1a1a3a@0.7:t=fill:enable='gte(t,6)',
    drawtext=text='5 philosophies.  5 paris.  Un objectif \: comprendre la realite.':fontfile=${FB}:fontsize=34:fontcolor=white:x=(w-tw)/2:y=822:alpha='if(lt(t,6),0,min(1,(t-6)/0.5))'
  " \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/09_synthesis.mp4"

echo "=== Generating Scene 10: Closing ==="
ffmpeg -y -f lavfi -i "color=c=#0a0a1a:s=${W}x${H}:d=5,format=yuv420p" \
  -vf "
    drawbox=x=0:y=0:w=iw:h=4:color=#6c3483@0.9:t=fill,
    drawbox=x=0:y=ih-4:w=iw:h=4:color=#3498db@0.9:t=fill,
    drawtext=text='WORLD MODELS':fontfile=${FB}:fontsize=80:fontcolor=white:x=(w-tw)/2:y=(h-th)/2-80:alpha='min(1,t/0.5)',
    drawbox=x=710:y=530:w=500:h=2:color=#6c3483@0.8:t=fill:enable='gte(t,0.5)',
    drawtext=text='Les frontieres vont s estomper.':fontfile=${FR}:fontsize=32:fontcolor=#aaaaaa:x=(w-tw)/2:y=(h/2)+30:alpha='if(lt(t,1),0,min(1,(t-1)/0.8))',
    drawtext=text='L avenir est hybride.':fontfile=${FR}:fontsize=32:fontcolor=#aaaaaa:x=(w-tw)/2:y=(h/2)+80:alpha='if(lt(t,1.5),0,min(1,(t-1.5)/0.8))',
    drawtext=text='Mars 2026':fontfile=${FR}:fontsize=22:fontcolor=#555555:x=(w-tw)/2:y=h-60:alpha='if(lt(t,2.5),0,min(1,(t-2.5)/0.8))'
  " \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/10_closing.mp4"

# ─────────────────────────────────────────────────────────────────────────────
# Transition
# ─────────────────────────────────────────────────────────────────────────────
echo "=== Creating transition ==="
ffmpeg -y -f lavfi -i "color=c=#0a0a1a:s=${W}x${H}:d=0.5,format=yuv420p" \
  -c:v libx264 -preset fast -crf 18 -r $FPS "$SCENES_DIR/transition.mp4"

# ─────────────────────────────────────────────────────────────────────────────
# Concatenate
# ─────────────────────────────────────────────────────────────────────────────
echo "=== Concatenating all scenes ==="

cat > "$SCENES_DIR/concat.txt" << EOF
file '01_title.mp4'
file 'transition.mp4'
file '02_problem.mp4'
file 'transition.mp4'
file '03_billions.mp4'
file 'transition.mp4'
file '04_jepa.mp4'
file 'transition.mp4'
file '05_spatial.mp4'
file 'transition.mp4'
file '06_simulation.mp4'
file 'transition.mp4'
file '07_nvidia.mp4'
file 'transition.mp4'
file '08_active.mp4'
file 'transition.mp4'
file '09_synthesis.mp4'
file 'transition.mp4'
file '10_closing.mp4'
EOF

ffmpeg -y -f concat -safe 0 -i "$SCENES_DIR/concat.txt" \
  -c:v libx264 -preset medium -crf 18 -r $FPS \
  -movflags +faststart \
  "$FINAL_VIDEO"

echo ""
echo "=== VIDEO GENERATED SUCCESSFULLY ==="
echo "Output: $FINAL_VIDEO"
ls -lh "$FINAL_VIDEO"
echo ""
echo "Duration:"
ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$FINAL_VIDEO" 2>/dev/null
echo "seconds"
