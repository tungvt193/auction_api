puts 'START IMPORT PRODUCT'

products =  [
  { ca: 'Xe nâng hàng', cm: 'NICHIYU', name: 'FB15PN-75-300', im: 'https://cdn.allstocker.com/resize/w/80/images/21e70d54-e87c-0d00-a11e-57dd093ce855/69aeee55-e87c-0d00-a142-e38c093ce855.jpg' },
  { ca: 'Máy xúc lật', cm: 'TCM', name: 'L6-2', im: 'https://cdn.allstocker.com/resize/w/80/images/fc5a4ef7-da7c-0d00-ae13-2640093ce855/27008803-db7c-0d00-afef-67b0093ce855.jpg' },
  { ca: 'Xe tải tự đổ', cm: 'ISUZU', name: 'PJ-CYZ51V5', im: 'https://cdn.allstocker.com/resize/w/80/images/5f31cd6b-a77b-0d00-a5d8-a83d05fccc98/524b0f6d-a77b-0d00-a5fd-471f05fccc98.jpg' },
  { ca: 'Cần cẩu', cm: 'TADANO', name: 'AR5500M-1-90101', im: 'https://cdn.allstocker.com/resize/w/80/images/e91a4366-c47c-0d00-b1ec-5b2a093ce855/001_47879c2d-22c0-4215-bfc9-430de926e640.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'KOMATSU', name: 'BR300S-2', im: 'https://cdn.allstocker.com/resize/w/80/images/66c476ba-4c44-0d00-8369-e8d5071faf9a/59a006bb-4c44-0d00-836e-ce61071faf9a.png' },
  { ca: 'Xe tải tự đổ', cm: 'MITSUBISHI', name: 'TKG-FK61F', im: 'https://cdn.allstocker.com/resize/w/80/images/20405966-c47c-0d00-b1ee-509e093ce855/001_a4dc431d-b02e-48fb-9c7d-88ad3e64ddc9.jpeg' },
  { ca: 'Máy xúc lật', cm: 'TCM', name: '343', im: 'https://cdn.allstocker.com/resize/w/80/images/e061fd94-be7c-0d00-874a-484d093ce855/7d19a69b-be7c-0d00-881b-c0e6093ce855.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'ATLAS COPCO', name: 'PC4', im: 'https://cdn.allstocker.com/resize/w/80/images/cb32c7fe-c17c-0d00-8c7c-486a093ce855/4dec0401-c27c-0d00-8cb2-eeea093ce855.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'Loại hình khác', name: 'NE250J', im: 'https://cdn.allstocker.com/resize/w/80/images/46c631f8-fe6a-0d00-b978-77c701eec01b/e310e1f9-fe6a-0d00-b98a-277801eec01b.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MC3000', im: 'https://cdn.allstocker.com/resize/w/80/images/e7a54346-be71-0d00-ae02-a8e3021d2fc2/152cba47-be71-0d00-ae36-6612021d2fc2.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'OKADA', name: 'SRS750C', im: 'https://cdn.allstocker.com/resize/w/80/images/852d2615-a840-0d00-9bc1-9bc70fe8abc3/c0f3ef15-a840-0d00-9bc6-ebf20fe8abc3.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'Loại hình khác', name: 'NE1200WR', im: 'https://cdn.allstocker.com/resize/w/80/images/3cffe9ff-fc6a-0d00-9d57-956901eec01b/8598ed00-fd6a-0d00-9d6d-52c601eec01b.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'Loại hình khác', name: 'NE100J', im: 'https://cdn.allstocker.com/resize/w/80/images/6df074d8-fc6a-0d00-9b00-a21501eec01b/74a3e8d9-fc6a-0d00-9b39-90ed01eec01b.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'KOMATSU', name: 'BM595F-2', im: 'https://cdn.allstocker.com/resize/w/80/images/7cfaa2f4-7f64-0d00-989a-bec50d050754/76fc0afc-7f64-0d00-98f2-b3ac0d050754.jpg' },
  { ca: 'Máy xúc', cm: 'CATERPILLAR', name: '5130', im: 'https://cdn.allstocker.com/resize/w/80/images/20be7297-bd23-46fc-8d9e-2f22b4653dc3/142409de-6dde-4c37-9c7f-4763b48463dd.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'Loại hình khác', name: 'NC420GX', im: 'https://cdn.allstocker.com/resize/w/80/images/36b6772a-6fc8-40eb-aaaf-f0ec66f9f445/1aaa94fe-9781-476c-b2f7-d1a89ea19c69.png' },
  { ca: 'Máy móc xây dựng khác', cm: 'HITACHI', name: 'SR-G2000', im: 'https://cdn.allstocker.com/resize/w/80/images/db6818ce-e85f-0d00-82fc-c3f608de2c71/99f965d1-e85f-0d00-8322-579d08de2c71.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'Loại hình khác', name: 'D580WT', im: 'https://cdn.allstocker.com/resize/w/80/images/5bf458ae-0897-4b67-94a0-aa5d1dff9a9c/51dbae90-092b-4af2-bb3c-5dc786ccf6fc.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'KOMATSU', name: 'BZ210', im: 'https://cdn.allstocker.com/resize/w/80/images/9cebd8c9-7279-0d00-a689-c41002419a88/b86ae3d0-7279-0d00-a752-e69402419a88.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'KOMATSU', name: 'BR350JG', im: 'https://cdn.allstocker.com/resize/w/80/images/d2f1dbc7-4c44-0d00-83fb-b831071faf9a/91bd95c8-4c44-0d00-8412-e5e9071faf9a.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'Loại hình khác', name: 'MKT300', im: 'https://cdn.allstocker.com/resize/w/80/images/2b6e32ef-e85f-0d00-851c-02f608de2c71/a85b1df0-e85f-0d00-8533-b44708de2c71.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'KOMATSU', name: 'BR100R', im: 'https://cdn.allstocker.com/resize/w/80/images/907fd671-8064-0d00-9fcb-240c0d050754/b0da0273-8064-0d00-9fdd-086c0d050754.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'Loại hình khác', name: 'RT2500', im: 'https://cdn.allstocker.com/resize/w/80/images/c215a70e-8064-0d00-9a16-e24a0d050754/f2d5f30f-8064-0d00-9a33-52060d050754.jpg' },
  { ca: 'Máy phát điện', cm: 'DENYO', name: 'DCA13USY', im: 'https://cdn.allstocker.com/resize/w/80/images/9e0dd2b7-0359-0d00-9d16-f72d0a556eb5/7b8f95b8-0359-0d00-9d21-81340a556eb5.jpg' },
  { ca: 'Máy xúc', cm: 'HITACHI', name: 'ZX120', im: 'https://cdn.allstocker.com/resize/w/80/images/dc23317b-f07a-0d00-9fa0-cd9e029fd716/26f9d27c-f07a-0d00-9fb7-6c1f029fd716.jpg' },
  { ca: 'Máy xúc mini', cm: 'CATERPILLAR', name: '303E', im: 'https://cdn.allstocker.com/resize/w/80/images/1c2e81b5-e85f-0d00-8177-fb3108de2c71/65e07d5c-be71-0d00-afed-88d0021d2fc2.jpg' },
  { ca: 'Cần cẩu', cm: 'KATO', name: 'KR255', im: 'https://cdn.allstocker.com/resize/w/80/images/f60e1c84-f07a-0d00-a02d-e3f3029fd716/a843aa86-f07a-0d00-a049-a1c2029fd716.jpg' },
  { ca: 'Máy xúc mini,Bộ phận', cm: 'KOMATSU', name: 'PC30MR-3', im: 'https://cdn.allstocker.com/resize/w/80/images/16ddc28c-f07a-0d00-a10c-a475029fd716/634c928d-f07a-0d00-a111-9b45029fd716.jpg' },
  { ca: 'Các loại xe khác', cm: 'Loại hình khác', name: 'SGC-CR5TS', im: 'https://cdn.allstocker.com/resize/w/80/images/0765af74-bc7b-0d00-acdf-567705fccc98/aaaaca76-bc7b-0d00-ad3b-f99305fccc98.jpg' },
  { ca: 'Xe nâng hàng', cm: 'NICHIYU', name: 'FBT15P-80-300', im: 'https://cdn.allstocker.com/resize/w/80/images/c025327c-757c-0d00-9df8-c6c8093ce855/f8c9a07d-757c-0d00-9e1a-04b3093ce855.jpg' },
  { ca: 'Các loại xe khác', cm: 'Loại hình khác', name: 'X710', im: 'https://cdn.allstocker.com/resize/w/80/images/7e447406-727c-0d00-8dd1-376a093ce855/b381828f-737c-0d00-ae33-ccbc093ce855.png' },
  { ca: 'Xe nâng hàng', cm: 'TOYOTA', name: '8FD40', im: 'https://cdn.allstocker.com/resize/w/80/images/864808d8-0143-0d00-aaa7-b96f037c3795/003_5dc217d9-1706-4cd7-b6a4-ed779bafb3f9.jpg' },
  { ca: 'Xe nâng hàng', cm: 'TOYOTA', name: '7FBRS15', im: 'https://cdn.allstocker.com/resize/w/80/images/d13c0667-6479-0d00-88cf-ed8902419a88/56b49169-6479-0d00-890e-adda02419a88.jpg' },
  { ca: 'Máy xúc lật', cm: 'KOMATSU', name: 'WA40-3E', im: 'https://cdn.allstocker.com/resize/w/80/images/0058aa54-4979-0d00-b1c5-e3070cc1ddc4/001_d0277833-bb39-4827-ae36-6d658f9f44eb.jpg' },
  { ca: 'Máy xúc mini', cm: 'HITACHI', name: 'ZX50U-2', im: 'https://cdn.allstocker.com/resize/w/80/images/ece802b3-ae54-0d00-9899-461e01bba691/005_a6572f96-966e-43f7-8199-7514f5c4c2f9.JPG' },
  { ca: 'Máy móc xây dựng khác', cm: 'Loại hình khác', name: 'NUL090-3', im: 'https://cdn.allstocker.com/resize/w/80/images/5a2a264a-757c-0d00-9984-ea01093ce855/fb83205f-757c-0d00-9b3e-db58093ce855.jpg' },
  { ca: 'Xe nâng hàng', cm: 'NICHIYU', name: 'FBRM9-75-250', im: 'https://cdn.allstocker.com/resize/w/80/images/7fede3b7-757c-0d00-a3ff-6b01093ce855/91fe4cb9-757c-0d00-a42b-548b093ce855.jpg' },
  { ca: 'Máy san đất', cm: 'KOMATSU', name: 'GD405A-3E0', im: 'https://cdn.allstocker.com/resize/w/80/images/25ca18a2-757c-0d00-a1f1-af6d093ce855/0206afae-757c-0d00-a310-3cdc093ce855.jpg' },
  { ca: 'Máy san đất', cm: 'KOMATSU', name: 'GD405A-3', im: 'https://cdn.allstocker.com/resize/w/80/images/8eee6996-757c-0d00-a0f0-aedf093ce855/fa6d229a-757c-0d00-a13c-e04e093ce855.jpg' },
  { ca: 'Máy san đất', cm: 'MITSUBISHI', name: 'MG230II', im: 'https://cdn.allstocker.com/resize/w/80/images/43262854-747c-0d00-821a-74d1093ce855/937a0257-747c-0d00-8258-af1a093ce855.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'KOMATSU', name: 'CD10R-1', im: 'https://cdn.allstocker.com/resize/w/80/images/25d37569-757c-0d00-9c32-cc97093ce855/400be774-757c-0d00-9d48-033f093ce855.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'KOMATSU', name: 'CD20R-2', im: 'https://cdn.allstocker.com/resize/w/80/images/b25d5374-3d73-0d00-a595-e7680f258db4/001_49182a94-2ab8-4c64-af4c-48e18ca7c148.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MST200VDR', im: 'https://cdn.allstocker.com/resize/w/80/images/41d17645-757c-0d00-98f7-3743093ce855/4c02e84c-757c-0d00-99c1-09a7093ce855.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MST300VD', im: 'https://cdn.allstocker.com/resize/w/80/images/1eb552a1-737c-0d00-afa1-bc5b093ce855/171d1ca4-737c-0d00-afde-d485093ce855.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MST-600VDL', im: 'https://cdn.allstocker.com/resize/w/80/images/0b456379-e465-0d00-bcf3-0ead0c3d3f6b/381456c0-fe6e-0d00-a072-990b00cffc2b.jpg' },
  { ca: 'Những loại khác', cm: 'Loại hình khác', name: 'U-3B', im: 'https://cdn.allstocker.com/resize/w/80/images/0ef3ff8e-6e7c-0d00-a0a9-5c7d093ce855/a6630391-6e7c-0d00-a0d9-c47b093ce855.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MST-600', im: 'https://cdn.allstocker.com/resize/w/80/images/1a7fb9bd-607c-0d00-b891-b154093ce855/001_cc46bfa5-4b38-4e88-8d38-325060ab12d9.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'YANMAR', name: 'C50R', im: 'https://cdn.allstocker.com/resize/w/80/images/8e5cd6bd-607c-0d00-b896-7e37093ce855/001_1645226d-bb93-4935-b5ea-9a8197ef9e26.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'IHI', name: 'IC45', im: 'https://cdn.allstocker.com/resize/w/80/images/b631eabd-607c-0d00-b898-88ed093ce855/001_7069752d-5eb0-4960-8b91-81d3978ad78e.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MST-1100', im: 'https://cdn.allstocker.com/resize/w/80/images/b3dc14be-607c-0d00-b8a0-761f093ce855/001_ec7e428d-4604-458a-9838-2e0177f1b860.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'KOMATSU', name: 'CD60R-1', im: 'https://cdn.allstocker.com/resize/w/80/images/ff7701be-607c-0d00-b89c-83ea093ce855/001_46c218cf-46f6-4d16-9255-55d6d1333d3e.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MST-1500V', im: 'https://cdn.allstocker.com/resize/w/80/images/08202dbe-607c-0d00-b8a2-fd97093ce855/001_51fe8d88-d86b-412d-9321-de5d8e8b9008.jpg' },
  { ca: 'Bộ phận,Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MST-1500VD', im: 'https://cdn.allstocker.com/resize/w/80/images/a01844be-607c-0d00-b8a6-caff093ce855/001_d209bc26-e176-4a63-a4bd-94d165db79f5.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'HITACHI', name: 'CG65D', im: 'https://cdn.allstocker.com/resize/w/80/images/a45e0979-7c7b-0d00-abcf-489306eb021a/001_03ef1b79-fc02-460d-bb42-398f0ec0e008.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'KOMATSU', name: 'CD110R-1', im: 'https://cdn.allstocker.com/resize/w/80/images/5b0758be-607c-0d00-b8aa-1a6b093ce855/001_e24dea41-dd0c-49ff-83e5-4dc52f7dfb0f.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MST-2000', im: 'https://cdn.allstocker.com/resize/w/80/images/32d37abe-607c-0d00-b8b1-5d70093ce855/001_90e21e52-1c6d-4773-bfe5-020d02959861.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MST-2200V', im: 'https://cdn.allstocker.com/resize/w/80/images/5d5f8fbe-607c-0d00-b8b5-5d0c093ce855/001_b6a9c378-ef4f-4949-b35b-ca3bbfe0c316.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'MOROOKA', name: 'MST-2200VD', im: 'https://cdn.allstocker.com/resize/w/80/images/6abdf90b-2379-0d00-855f-a0de02419a88/009_4a1c1d3a-f0b9-459f-9f70-5235a908dc28.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'HITACHI', name: 'EG110R', im: 'https://cdn.allstocker.com/resize/w/80/images/14a6a3be-607c-0d00-b8bf-de1d093ce855/001_bef8fe1d-f232-47ec-81db-5a5f258b0c0b.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'IHI', name: 'IC100', im: 'https://cdn.allstocker.com/resize/w/80/images/61ddd1be-607c-0d00-b8c9-6c5a093ce855/001_9e5c079f-d425-469c-9fc4-c6792ef6d404.jpg' },
  { ca: 'Máy móc xây dựng khác', cm: 'IHI', name: 'IC100-2', im: 'https://cdn.allstocker.com/resize/w/80/images/a980e5be-607c-0d00-b8cb-3610093ce855/001_032694f4-413f-44f5-b33b-1dd118e60c75.jpg' },
  { ca: 'Máy ủi', cm: 'KOMATSU', name: 'D155A-1', im: 'https://cdn.allstocker.com/resize/w/80/images/e64900bf-607c-0d00-b8cd-f213093ce855/001_5cfd4196-f86a-4057-8613-11788fe9f316.jpg' },
  { ca: 'Máy ủi', cm: 'KOMATSU', name: 'D155A-2', im: 'https://cdn.allstocker.com/resize/w/80/images/9c3315bf-607c-0d00-b8d1-3268093ce855/001_4b5781b7-3aa6-45ff-945c-4ea7aa420503.jpg' },
  { ca: 'Máy ủi', cm: 'CATERPILLAR', name: 'D7R', im: 'https://cdn.allstocker.com/resize/w/80/images/604e2dbf-607c-0d00-b8de-deff093ce855/001_c5c1dc8f-95df-4fec-af5a-b67995304403.jpg' },
  { ca: 'Máy ủi', cm: 'KOMATSU', name: 'D40P-1', im: 'https://cdn.allstocker.com/resize/w/80/images/b7dc83ed-bb64-4fa2-9dd9-7d3b3264fe62/001_bdb3fb97-5223-4e18-bf49-d532ae0d2c49.jpg' },
  { ca: 'Máy ủi', cm: 'CATERPILLAR', name: 'D5G', im: 'https://cdn.allstocker.com/resize/w/80/images/59a829f4-0c6e-4988-bf03-1cd14d29fe39/001_3f6bf485-e694-4cf8-98a4-c3baf315fb90.jpg' },
  { ca: 'Máy ủi', cm: 'KOMATSU', name: 'D53P-18E', im: 'https://cdn.allstocker.com/resize/w/80/images/91e840bf-607c-0d00-b8e1-04cd093ce855/001_4cc36e60-e62e-4b58-9080-a552c0cf548e.jpg' },
  { ca: 'Máy ủi', cm: 'KOMATSU', name: 'D61PX-15E0', im: 'https://cdn.allstocker.com/resize/w/80/images/4cdd56bf-607c-0d00-b8ed-7c7b093ce855/001_2e2b70f7-0928-4bba-b8d1-ce663a468c29.jpg' },
  { ca: 'Máy ủi', cm: 'KOMATSU', name: 'D65PX-15E0', im: 'https://cdn.allstocker.com/resize/w/80/images/1fe4bd9e-1b68-4335-b9fe-7f63e471c13d/9c09f41d-f16e-0d00-a607-6e9400cffc2b.png' },
  { ca: 'Máy ủi', cm: 'CATERPILLAR,KOMATSU', name: 'D65PX-16', im: 'https://cdn.allstocker.com/resize/w/80/images/c5016bbf-607c-0d00-b8f1-0fdf093ce855/001_116d25e5-8500-44f4-8161-8211acee1166.jpg' },
  { ca: 'Con lăn', cm: 'KOMATSU', name: 'JV40CW-5', im: 'https://cdn.allstocker.com/resize/w/80/images/bbf57ebf-607c-0d00-b8f4-2bc0093ce855/001_c5d4bd8f-f4c8-4f6c-9abb-a04fb8e5a2de.jpg' },
  { ca: 'Con lăn', cm: 'KOMATSU', name: 'JV40CW-5E0', im: 'https://cdn.allstocker.com/resize/w/80/images/5a6ca7bf-607c-0d00-b8f8-8972093ce855/001_69e3f06c-67b4-4f31-b474-972825bdc20d.jpg' },
  { ca: 'Con lăn', cm: 'SAKAI', name: 'SW502-1', im: 'https://cdn.allstocker.com/resize/w/80/images/99d793bf-607c-0d00-b8f6-91d6093ce855/001_5e3d6b97-4e0d-4dfa-9c16-4eddccb267a5.jpg' },
  { ca: 'Con lăn', cm: 'SAKAI', name: 'T2', im: 'https://cdn.allstocker.com/resize/w/80/images/9fd2babf-607c-0d00-b8fa-ad73093ce855/001_6c07dbaf-6208-409f-909b-82106a9e790d.jpg' },
  { ca: 'Con lăn', cm: 'KOMATSU', name: 'JV100WA', im: 'https://cdn.allstocker.com/resize/w/80/images/cb6ccfbf-607c-0d00-b8fc-a914093ce855/001_0eb85a06-c530-464b-b6d3-a6834424a456.jpg' },
  { ca: 'Con lăn', cm: 'SAKAI', name: 'SV900TV', im: 'https://cdn.allstocker.com/resize/w/80/images/3d1dfcf2-644a-0d00-9df1-5814095b4043/001_e925e1ef-4f7c-49df-bdbc-c94166ce8107.JPG' },
  { ca: 'Máy xúc', cm: 'CATERPILLAR', name: '320', im: 'https://cdn.allstocker.com/resize/w/80/images/b5b1e4bf-607c-0d00-b8fe-14ac093ce855/001_9f348217-01f4-4bfd-ab1c-07dc84dea30b.jpg' },
  { ca: 'Máy xúc lật', cm: 'TOYOTA', name: '5SDKL5', im: 'https://cdn.allstocker.com/resize/w/80/images/8348f9bf-607c-0d00-b902-a6dd093ce855/001_933283ce-730f-4765-be92-c172fb8dc15c.jpg' },
  { ca: 'Máy xúc lật,Máy móc xây dựng khác', cm: 'KOMATSU', name: 'WA500-6', im: 'https://cdn.allstocker.com/resize/w/80/images/f56335c0-607c-0d00-b909-117a093ce855/001_04bc9401-7296-4ff9-9bfb-58b52cdf247b.jpg' },
  { ca: 'Máy xúc lật', cm: 'HITACHI', name: 'ZW220-5B', im: 'https://cdn.allstocker.com/resize/w/80/images/aa4349c0-607c-0d00-b90b-73d1093ce855/001_c5da4f07-3eec-4d26-9340-8f2d666f6a88.jpg' },
  { ca: 'Máy xúc lật', cm: 'KOMATSU', name: 'WA380-7', im: 'https://cdn.allstocker.com/resize/w/80/images/b8a4e973-bc78-0d00-a7c1-9d2e004cab97/001_59bc7ee1-d1c8-49a5-bf45-776061edcd76.jpg' },
  { ca: 'Máy xúc lật', cm: 'CATERPILLAR', name: '950H', im: 'https://cdn.allstocker.com/resize/w/80/images/fb170c65-bc78-0d00-a7b1-f1fb004cab97/001_b019f4db-e727-4812-b7d0-7e06145b54cd.jpg' },
  { ca: 'Máy xúc lật', cm: 'TCM', name: 'L32-3', im: 'https://cdn.allstocker.com/resize/w/80/images/15439e6a-bc78-0d00-a7b7-c5f7004cab97/001_611ccc92-c7de-4100-8aa6-2516bf1112bb.jpg' },
  { ca: 'Máy xúc lật', cm: 'TCM', name: 'L27-3', im: 'https://cdn.allstocker.com/resize/w/80/images/546911c8-5f7c-0d00-a441-df28093ce855/001_1ce54a28-cd66-45cd-a5ff-5c24bc6472b1.jpg' },
  { ca: 'Máy xúc lật', cm: 'TCM', name: '850-2', im: 'https://cdn.allstocker.com/resize/w/80/images/6fea25c8-5f7c-0d00-a446-a1db093ce855/001_2136c00a-209c-4774-a2a8-1b922c56514b.jpg' },
  { ca: 'Máy xúc lật', cm: 'TCM', name: 'L19', im: 'https://cdn.allstocker.com/resize/w/80/images/54083cc8-5f7c-0d00-a44a-4565093ce855/001_e5418a7d-f2b0-49e5-abe5-ec18e14745d5.jpg' },
  { ca: 'Cần cẩu', cm: 'CATERPILLAR', name: '920', im: 'https://cdn.allstocker.com/resize/w/80/images/2dd161c8-5f7c-0d00-a463-b26a093ce855/001_d12a8a80-2785-413d-a124-3578dfb47d97.jpg' },
  { ca: 'Máy xúc lật', cm: 'CATERPILLAR', name: '916', im: 'https://cdn.allstocker.com/resize/w/80/images/880a7cc8-5f7c-0d00-a471-3eb8093ce855/001_10783329-4864-4153-a098-420e5c96774f.jpg' },
  { ca: 'Máy xúc lật', cm: 'KOMATSU', name: 'WA100-3', im: 'https://cdn.allstocker.com/resize/w/80/images/68c391c8-5f7c-0d00-a485-d0a5093ce855/001_65071148-a0fa-4e50-bc85-48e893f6eb88.jpg' },
  { ca: 'Máy xúc lật', cm: 'TCM', name: 'L5-2', im: 'https://cdn.allstocker.com/resize/w/80/images/f6aca7c8-5f7c-0d00-a487-5319093ce855/001_29192f23-0a66-43c8-9b25-6aaf4d2287ea.jpg' },
  { ca: 'Máy xúc lật', cm: 'KOMATSU', name: 'WA30-6N0', im: 'https://cdn.allstocker.com/resize/w/80/images/ad0fc0c8-5f7c-0d00-a489-2556093ce855/001_1528a794-5f35-43f4-af47-61572b0906f3.jpg' },
  { ca: 'Máy xúc', cm: 'HITACHI', name: 'ZX200LC-3', im: 'https://cdn.allstocker.com/resize/w/80/images/71a1e8c8-5f7c-0d00-a48d-7d8d093ce855/001_d995ade2-5a04-490c-b5d3-38861ee5be95.jpg' },
  { ca: 'Máy xúc', cm: 'HITACHI', name: 'ZX135US', im: 'https://cdn.allstocker.com/resize/w/80/images/69b5d2c8-5f7c-0d00-a48b-ebd6093ce855/001_db9c75e6-25da-4a36-959b-382af2a402fd.jpg' },
  { ca: 'Máy xúc', cm: 'HITACHI', name: 'ZX120-3', im: 'https://cdn.allstocker.com/resize/w/80/images/410efdc8-5f7c-0d00-a490-9820093ce855/001_adc5f00f-4d05-463e-8ae3-8315a1b0c96d.jpg' },
  { ca: 'Máy xúc', cm: 'SUMITOMO', name: 'SH75X-3B', im: 'https://cdn.allstocker.com/resize/w/80/images/2fab10c9-5f7c-0d00-a494-7263093ce855/001_c2f683bb-65b4-4245-abc5-4b9263d4638a.jpg' },
  { ca: 'Máy xúc', cm: 'SUMITOMO,KATO', name: 'SH200-5', im: 'https://cdn.allstocker.com/resize/w/80/images/d1fb142e-197a-0d00-9d85-ad4e0443afe6/001_4443272b-7eac-4b3d-a9c6-a4c7cfa71864.jpg' },
  { ca: 'Máy xúc', cm: 'HITACHI', name: 'ZX225USR-5B', im: 'https://cdn.allstocker.com/resize/w/80/images/f983dbfd-40b9-4831-991f-f79253668e09/001_6df518da-4b4d-4c5f-989a-7959dbe16838.jpg' },
  { ca: 'Máy xúc', cm: 'HITACHI', name: 'ZX225US-5B', im: 'https://cdn.allstocker.com/resize/w/80/images/4f3724c9-5f7c-0d00-a496-d495093ce855/001_7206b53e-9d3f-41d2-8f65-465c38452418.jpg' },
  { ca: 'Máy xúc', cm: 'HITACHI', name: 'ZX225USRK-3', im: 'https://cdn.allstocker.com/resize/w/80/images/d7ffa117-fb37-4bc6-b426-7a2bf5ef40db/001_1f454e00-85a8-4726-9a2a-3a342ef24609.jpg' },
  { ca: 'Máy xúc,Bộ phận', cm: 'HITACHI', name: 'ZX200-3', im: 'https://cdn.allstocker.com/resize/w/80/images/c32d03c5-59a4-4928-aaff-01771bcb578a/001_54305e7c-9737-4652-8e2e-f19a1f6ac3aa.jpg' }
]

now = Time.zone.now

categories = Category.select(:id, :name)
companies = Company.select(:id, :name)

products.each_with_index do |product, index|
  puts "MAKE PRODUCT #{index + 1} / #{products.size}"

  e_companies = companies.select { |com| product[:cm].split(',').include?(com.try(:name)) }
  cx = categories.to_a.detect { |c| product[:ca].to_s.downcase.include?(c.try(:name).downcase) }

  company_attributes = e_companies.map { |e_company| { company_id: e_company.try(:id) } }

  pro = Product.new(
    name: product[:name],
    category_id: cx.try(:id),
    status: 'active',
    created_at: now,
    updated_at: now,
    product_companies_attributes: company_attributes
  )

  pro.thumb = Product.download_image(index, product[:im])
  pro.save!
end

puts 'FINISH IMPORT PRODUCT'
