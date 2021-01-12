# Generated by Django 3.1.1 on 2021-01-12 13:23

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Clinic',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=40, null=True)),
                ('acronym', models.CharField(max_length=40, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Form',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('id_form', models.CharField(max_length=15, primary_key=True, serialize=False)),
                ('submitted_at', models.DateTimeField(null=True)),
                ('habilitado', models.BooleanField(blank=True, max_length=1, null=True)),
                ('completed', models.BooleanField(blank=True, max_length=1, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Identidad_etnica',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('identidad', models.CharField(max_length=40, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Parentesco',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipo_parentesco', models.CharField(blank=True, max_length=40, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Patient',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('name', models.CharField(max_length=40, null=True)),
                ('id_patient', models.CharField(max_length=15, primary_key=True, serialize=False)),
            ],
        ),
        migrations.CreateModel(
            name='Prueba_genetica',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipo_prueba_genetica', models.CharField(blank=True, max_length=40, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='SubForm_historia_personal',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('clinic', models.CharField(choices=[(0, 'Max Peralta'), (1, 'San Juan De Dios')], max_length=5, null=True)),
                ('nombre', models.CharField(blank=True, max_length=40, null=True)),
                ('cedula', models.CharField(blank=True, max_length=40, null=True)),
                ('fecha_de_nacimiento', models.DateField(blank=True, null=True)),
                ('nacionalidad', models.CharField(choices=[(0, 'Afganistán'), (1, 'Albania'), (2, 'Alemania'), (3, 'Andorra'), (4, 'Angola'), (5, 'Anguila'), (6, 'Antártida'), (7, 'Antigua y Barbuda'), (8, 'Arabia Saudita'), (9, 'Argelia'), (10, 'Argentina'), (11, 'Armenia'), (12, 'Aruba'), (13, 'Australia'), (14, 'Austria'), (15, 'Azerbaiyán'), (16, 'Bélgica'), (17, 'Bahamas'), (18, 'Bahrein'), (19, 'Bangladesh'), (20, 'Barbados'), (21, 'Belice'), (22, 'Benín'), (23, 'Bhután'), (24, 'Bielorrusia'), (25, 'Birmania'), (26, 'Bolivia'), (27, 'Bosnia y Herzegovina'), (28, 'Botsuana'), (29, 'Brasil'), (30, 'Brunéi'), (31, 'Bulgaria'), (32, 'Burkina Faso'), (33, 'Burundi'), (34, 'Cabo Verde'), (35, 'Camboya'), (36, 'Camerún'), (37, 'Canadá'), (38, 'Chad'), (39, 'Chile'), (40, 'China'), (41, 'Chipre'), (42, 'Ciudad del Vaticano'), (43, 'Colombia'), (44, 'Comoras'), (45, 'República del Congo'), (46, 'República Democrática del Congo'), (47, 'Corea del Norte'), (48, 'Corea del Sur'), (49, 'Costa de Marfil'), (50, 'Costa Rica'), (51, 'Croacia'), (52, 'Cuba'), (53, 'Curazao'), (54, 'Dinamarca'), (55, 'Dominica'), (56, 'Ecuador'), (57, 'Egipto'), (58, 'El Salvador'), (59, 'Emiratos Árabes Unidos'), (60, 'Eritrea'), (61, 'Eslovaquia'), (62, 'Eslovenia'), (63, 'España'), (64, 'Estados Unidos de América'), (65, 'Estonia'), (66, 'Etiopía'), (67, 'Filipinas'), (68, 'Finlandia'), (69, 'Fiyi'), (70, 'Francia'), (71, 'Gabón'), (72, 'Gambia'), (73, 'Georgia'), (74, 'Ghana'), (75, 'Gibraltar'), (76, 'Granada'), (77, 'Grecia'), (78, 'Groenlandia'), (79, 'Guadalupe'), (80, 'Guam'), (81, 'Guatemala'), (82, 'Guayana Francesa'), (83, 'Guernsey'), (84, 'Guinea'), (85, 'Guinea Ecuatorial'), (86, 'Guinea-Bissau'), (87, 'Guyana'), (88, 'Haití'), (89, 'Honduras'), (90, 'Hong kong'), (91, 'Hungría'), (92, 'India'), (93, 'Indonesia'), (94, 'Irán'), (95, 'Irak'), (96, 'Irlanda'), (97, 'Isla Bouvet'), (98, 'Isla de Man'), (99, 'Isla de Navidad'), (100, 'Isla Norfolk'), (101, 'Islandia'), (102, 'Islas Bermudas'), (103, 'Islas Caimán'), (104, 'Islas Cocos (Keeling)'), (105, 'Islas Cook'), (106, 'Islas de Åland'), (107, 'Islas Feroe'), (108, 'Islas Georgias del Sur y Sandwich del Sur'), (109, 'Islas Heard y McDonald'), (110, 'Islas Maldivas'), (111, 'Islas Malvinas'), (112, 'Islas Marianas del Norte'), (113, 'Islas Marshall'), (114, 'Islas Pitcairn'), (115, 'Islas Salomón'), (116, 'Islas Turcas y Caicos'), (117, 'Islas Ultramarinas Menores de Estados Unidos'), (118, 'Islas Vírgenes Británicas'), (119, 'Islas Vírgenes de los Estados Unidos'), (120, 'Israel'), (121, 'Italia'), (122, 'Jamaica'), (123, 'Japón'), (124, 'Jersey'), (125, 'Jordania'), (126, 'Kazajistán'), (127, 'Kenia'), (128, 'Kirguistán'), (129, 'Kiribati'), (130, 'Kuwait'), (131, 'Líbano'), (132, 'Laos'), (133, 'Lesoto'), (134, 'Letonia'), (135, 'Liberia'), (136, 'Libia'), (137, 'Liechtenstein'), (138, 'Lituania'), (139, 'Luxemburgo'), (140, 'México'), (141, 'Mónaco'), (142, 'Macao'), (143, 'Macedônia'), (144, 'Madagascar'), (145, 'Malasia'), (146, 'Malawi'), (147, 'Mali'), (148, 'Malta'), (149, 'Marruecos'), (150, 'Martinica'), (151, 'Mauricio'), (152, 'Mauritania'), (153, 'Mayotte'), (154, 'Micronesia'), (155, 'Moldavia'), (156, 'Mongolia'), (157, 'Montenegro'), (158, 'Montserrat'), (159, 'Mozambique'), (160, 'Namibia'), (161, 'Nauru'), (162, 'Nepal'), (163, 'Nicaragua'), (164, 'Niger'), (165, 'Nigeria'), (166, 'Niue'), (167, 'Noruega'), (168, 'Nueva Caledonia'), (169, 'Nueva Zelanda'), (170, 'Omán'), (171, 'Países Bajos'), (172, 'Pakistán'), (173, 'Palau'), (174, 'Palestina'), (175, 'Panamá'), (176, 'Papúa Nueva Guinea'), (177, 'Paraguay'), (178, 'Perú'), (179, 'Polinesia Francesa'), (180, 'Polonia'), (181, 'Portugal'), (182, 'Puerto Rico'), (183, 'Qatar'), (184, 'Reino Unido'), (185, 'República Centroafricana'), (186, 'República Checa'), (187, 'República Dominicana'), (188, 'República de Sudán del Sur'), (189, 'Reunión'), (190, 'Ruanda'), (191, 'Rumanía'), (192, 'Rusia'), (193, 'Sahara Occidental'), (194, 'Samoa'), (195, 'Samoa Americana'), (196, 'San Bartolomé'), (197, 'San Cristóbal y Nieves'), (198, 'San Marino'), (199, 'San Martín (Francia)'), (200, 'San Pedro y Miquelón'), (201, 'San Vicente y las Granadinas'), (202, 'Santa Elena'), (203, 'Santa Lucía'), (204, 'Santo Tomé y Príncipe'), (205, 'Senegal'), (206, 'Serbia'), (207, 'Seychelles'), (208, 'Sierra Leona'), (209, 'Singapur'), (210, 'Sint Maarten'), (211, 'Siria'), (212, 'Somalia'), (213, 'Sri lanka'), (214, 'Sudáfrica'), (215, 'Sudán'), (216, 'Suecia'), (217, 'Suiza'), (218, 'Surinám'), (219, 'Svalbard y Jan Mayen'), (220, 'Swazilandia'), (221, 'Tayikistán'), (222, 'Tailandia'), (223, 'Taiwán'), (224, 'Tanzania'), (225, 'Territorio Británico del Océano Índico'), (226, 'Territorios Australes y Antárticas Franceses'), (227, 'Timor Oriental'), (228, 'Togo'), (229, 'Tokelau'), (230, 'Tonga'), (231, 'Trinidad y Tobago'), (232, 'Tunez'), (233, 'Turkmenistán'), (234, 'Turquía'), (235, 'Tuvalu'), (236, 'Ucrania'), (237, 'Uganda'), (238, 'Uruguay'), (239, 'Uzbekistán'), (240, 'Vanuatu'), (241, 'Venezuela'), (242, 'Vietnam'), (243, 'Wallis y Futuna'), (244, 'Yemen'), (245, 'Yibuti'), (246, 'Zambia'), (247, 'Zimbabue')], max_length=2, null=True)),
                ('identidad_etnica', models.CharField(choices=[(0, 'No sabe'), (1, 'Indígena'), (2, 'Afrodescendiente'), (3, 'Origen asiático'), (4, 'Mulata'), (5, 'Mestiza'), (6, 'Blanca')], default=0, max_length=2)),
                ('identidad_etnica_otro', models.CharField(blank=True, max_length=40, null=True)),
                ('peso', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('talla', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('imc', models.FloatField(blank=True, null=True)),
                ('fuma', models.BooleanField(blank=True, max_length=1, null=True)),
                ('fuma_edad', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('fuma_actualmente', models.BooleanField(blank=True, max_length=1, null=True)),
                ('fuma_cuanto', models.CharField(blank=True, max_length=40, null=True)),
                ('bebidas', models.BooleanField(blank=True, max_length=1, null=True)),
                ('bebidas_cuanto', models.CharField(choices=[(0, 'Más de tres a la semana'), (1, 'Más de dos al día'), (2, 'Otro')], default=0, max_length=2)),
                ('bebidas_cuanto_otro', models.CharField(blank=True, max_length=40, null=True)),
                ('actividad_fisica', models.BooleanField(blank=True, max_length=1, null=True)),
                ('actividad_fisica_cuanto', models.CharField(blank=True, max_length=40, null=True)),
                ('consume_alimentos_con_grasa', models.BooleanField(blank=True, max_length=1, null=True)),
                ('consume_veg_frut_gram', models.BooleanField(blank=True, max_length=1, null=True)),
                ('diabetes', models.CharField(choices=[(0, 'Ninguna'), (1, 'Tipo 1'), (2, 'Tipo 2')], default=0, max_length=2)),
                ('toma_medicamento_tamoxifeno', models.BooleanField(blank=True, max_length=1, null=True)),
                ('cuanto_tamoxifeno', models.CharField(blank=True, max_length=40, null=True)),
                ('toma_medicamento_anastrozol', models.BooleanField(blank=True, max_length=1, null=True)),
                ('cuanto_anastrozol', models.CharField(blank=True, max_length=40, null=True)),
                ('toma_medicamento_metformina', models.BooleanField(blank=True, max_length=1, null=True)),
                ('cuanto_metformina', models.CharField(blank=True, max_length=40, null=True)),
                ('toma_medicamento_bifosfonatos', models.BooleanField(blank=True, max_length=1, null=True)),
                ('cuanto_bifosfonatos', models.CharField(blank=True, max_length=40, null=True)),
                ('toma_medicamento_aspirina', models.BooleanField(blank=True, max_length=1, null=True)),
                ('cuanto_aspirina', models.CharField(blank=True, max_length=40, null=True)),
                ('tratamiento_torax', models.BooleanField(blank=True, max_length=1, null=True)),
                ('form', models.OneToOneField(default=2, on_delete=django.db.models.deletion.PROTECT, related_name='subform_hist_per', to='main.form')),
            ],
        ),
        migrations.CreateModel(
            name='SubForm_historia_familiar',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('prueba_genetica', models.BooleanField(blank=True, max_length=1, null=True)),
                ('prueba_genetica_resultado', models.CharField(choices=[], max_length=5, null=True)),
                ('prueba_genetica_otro', models.CharField(blank=True, default=None, max_length=40, null=True)),
                ('familiares_mama', models.BooleanField(blank=True, max_length=1, null=True)),
                ('parentesco', models.CharField(choices=[], max_length=5, null=True)),
                ('familiares_cancer', models.BooleanField(blank=True, max_length=1, null=True)),
                ('familiares_cancer_tipo', models.CharField(blank=True, max_length=40, null=True)),
                ('familiares_cancer_parentesco', models.CharField(blank=True, max_length=40, null=True)),
                ('form', models.OneToOneField(default=2, on_delete=django.db.models.deletion.PROTECT, related_name='subform_hist_fam', to='main.form')),
            ],
        ),
        migrations.CreateModel(
            name='SubForm_antecedentes_g_o',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('menopausia_aplica', models.BooleanField(blank=True, max_length=1, null=True)),
                ('edad_menstruacion', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('edad_menopausia', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('parto_aplica', models.BooleanField(blank=True, max_length=1, null=True)),
                ('parto_cantidad', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('edad_ult_hijo', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('lactancia_aplica', models.BooleanField(blank=True, max_length=1, null=True)),
                ('lactancia_tiempo', models.CharField(blank=True, max_length=40, null=True)),
                ('anticonceptivos_aplica', models.BooleanField(blank=True, max_length=1, null=True)),
                ('anticonceptivos_cuanto', models.CharField(blank=True, max_length=40, null=True)),
                ('anticonceptivos_ult_vez', models.CharField(blank=True, max_length=40, null=True)),
                ('terapia_hormonal_aplica', models.BooleanField(blank=True, max_length=1, null=True)),
                ('terapia', models.CharField(choices=[(0, 'No sabe'), (1, 'Sistémico (Oral)'), (2, 'Tópico (Crema o Parche)'), (3, 'Intravaginal (Óvulos o Anillo)')], max_length=5, null=True)),
                ('cuanto_tiempo_terapia', models.CharField(blank=True, max_length=40, null=True)),
                ('biopsia_aplica', models.BooleanField(blank=True, max_length=1, null=True)),
                ('biopsia_cuantas', models.PositiveSmallIntegerField(blank=True, null=True)),
                ('biopsia_resultado', models.CharField(blank=True, max_length=40, null=True)),
                ('form', models.OneToOneField(default=2, on_delete=django.db.models.deletion.PROTECT, related_name='subform_ant_g_o', to='main.form')),
            ],
        ),
        migrations.CreateModel(
            name='Report',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('contenido', models.CharField(max_length=500, null=True)),
                ('formulario', models.OneToOneField(default=1, on_delete=django.db.models.deletion.PROTECT, to='main.form')),
                ('user', models.ForeignKey(default=2, on_delete=django.db.models.deletion.PROTECT, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('user', models.OneToOneField(default=1, on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='auth.user')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('clinic', models.ForeignKey(default=2, null=True, on_delete=django.db.models.deletion.PROTECT, to='main.clinic')),
            ],
        ),
        migrations.CreateModel(
            name='Mamografia',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('url_imagen', models.URLField(null=True, unique=True)),
                ('filename', models.CharField(max_length=500, null=True, unique=True)),
                ('form', models.ForeignKey(default=2, on_delete=django.db.models.deletion.PROTECT, to='main.form')),
            ],
        ),
        migrations.AddField(
            model_name='form',
            name='id_patient',
            field=models.ForeignKey(default=2, null=True, on_delete=django.db.models.deletion.PROTECT, to='main.patient'),
        ),
    ]
