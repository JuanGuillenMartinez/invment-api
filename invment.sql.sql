CREATE TABLE `categories`  (
  `id_category` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `companies`  (
  `id_company` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_company_detail` bigint UNSIGNED NOT NULL,
  `id_status` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_company`) USING BTREE,
  INDEX `companies_id_company_detail_foreign`(`id_company_detail` ASC) USING BTREE,
  INDEX `companies_id_status_foreign`(`id_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `company_details`  (
  `id_company_detail` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `rfc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_company_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `corporations`  (
  `id_corporation` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_corporation`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `currencies`  (
  `id_currency` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `currency_iso` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `language` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `money` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `symbol` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_currency`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `employees`  (
  `id_employee` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_subsidiary` bigint UNSIGNED NOT NULL,
  `id_person` bigint UNSIGNED NOT NULL,
  `id_employment_information` bigint UNSIGNED NOT NULL,
  `id_job` bigint UNSIGNED NOT NULL,
  `id_status` bigint UNSIGNED NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfc` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_employee`) USING BTREE,
  INDEX `employees_id_subsidiary_foreign`(`id_subsidiary` ASC) USING BTREE INVISIBLE,
  INDEX `employees_id_person_foreign`(`id_person` ASC) USING BTREE INVISIBLE,
  INDEX `employees_id_employment_information_foreign`(`id_employment_information` ASC) USING BTREE,
  INDEX `employees_id_status_foreign`(`id_status` ASC) USING BTREE,
  INDEX `employees_id_job_foreign`(`id_job` ASC) USING BTREE INVISIBLE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `employment_informations`  (
  `id_employment_information` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `salary` decimal(8, 2) NOT NULL,
  `bonus` decimal(8, 2) NOT NULL,
  `discount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_employment_information`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `genders`  (
  `id_gender` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_gender`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `invoices`  (
  `id_invoice` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_transaction` bigint UNSIGNED NOT NULL,
  `id_payment` bigint UNSIGNED NOT NULL,
  `id_status` bigint UNSIGNED NOT NULL,
  `digital_sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8, 2) NOT NULL,
  `amount_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_invoice`) USING BTREE,
  INDEX `invoices_id_transaction_foreign`(`id_transaction` ASC) USING BTREE,
  INDEX `invoices_id_payment_foreign`(`id_payment` ASC) USING BTREE,
  INDEX `invoices_id_status_foreign`(`id_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `job_details`  (
  `id_job_detail` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `base_salary` decimal(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_job_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `jobs`  (
  `id_job` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_job_detail` bigint UNSIGNED NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_job`) USING BTREE,
  INDEX `jobs_id_job_detail_foreign`(`id_job_detail` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `payments`  (
  `id_payment` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_subsidiary` bigint UNSIGNED NOT NULL,
  `id_status` bigint UNSIGNED NOT NULL,
  `id_region` bigint UNSIGNED NOT NULL,
  `id_currency` bigint UNSIGNED NOT NULL,
  `card_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date NOT NULL,
  `cvv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_payment`) USING BTREE,
  INDEX `payments_id_subsidiary_foreign`(`id_subsidiary` ASC) USING BTREE INVISIBLE,
  INDEX `payments_id_status_foreign`(`id_status` ASC) USING BTREE INVISIBLE,
  INDEX `payments_id_currency_foreign`(`id_currency` ASC) USING BTREE,
  INDEX `payments_id_region_foreign`(`id_region` ASC) USING BTREE INVISIBLE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `persons`  (
  `id_person` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_gender` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_day` int NOT NULL,
  `birth_month` int NOT NULL,
  `birth_year` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_person`) USING BTREE,
  INDEX `id_gender`(`id_gender` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `presentations`  (
  `id_presentation` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` int NOT NULL,
  `measurement_unit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `packaging` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_presentation`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `product_details`  (
  `id_product_detail` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` varchar(650) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bar_code` varchar(650) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_product_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `products`  (
  `id_product` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_product_detail` bigint UNSIGNED NOT NULL,
  `id_corporation` bigint UNSIGNED NOT NULL,
  `id_presentation` bigint UNSIGNED NOT NULL,
  `id_subcategory` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`) USING BTREE,
  INDEX `products_id_product_detail_foreign`(`id_product_detail` ASC) USING BTREE INVISIBLE,
  INDEX `products_id_corporations_foreign`(`id_corporation` ASC) USING BTREE,
  INDEX `products_id_presentations_foreign`(`id_presentation` ASC) USING BTREE INVISIBLE,
  INDEX `products_id_subcategories_foreign`(`id_subcategory` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `providers`  (
  `id_provider` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_provider`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `purchase_schedullings`  (
  `id_purchase_schedulling` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_subsidiary_provider` bigint UNSIGNED NOT NULL,
  `schedule_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_purchase_schedulling`) USING BTREE,
  INDEX `purchase_schedulling_id_subsidiary_provider_foreign`(`id_subsidiary_provider` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `purchases`  (
  `id_purchase` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_transaction` bigint UNSIGNED NOT NULL,
  `id_subsidiary_provider` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_purchase`) USING BTREE,
  INDEX `purchases_id_transaction_foreign`(`id_transaction` ASC) USING BTREE,
  INDEX `purchases_id_subsidiary_provider_foreign`(`id_subsidiary_provider` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `regions`  (
  `id_region` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `abbreviation` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_region`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `sales`  (
  `id_sale` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_transaction` bigint UNSIGNED NOT NULL,
  `purchaser_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sale`) USING BTREE,
  INDEX `sales_id_transaction_foreign`(`id_transaction` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `status`  (
  `id_status` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `subcategories`  (
  `id_subcategory` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_category` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_subcategory`) USING BTREE,
  INDEX `subcategories_id_category_foreign`(`id_category` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `subsidiaries`  (
  `id_subsidiary` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_company` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rfc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_time` time NOT NULL,
  `closing_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_subsidiary`) USING BTREE,
  INDEX `subsidiaries_id_company_foreign`(`id_company` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `subsidiary_products`  (
  `id_product_subsidiary` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_subsidiary` bigint UNSIGNED NOT NULL,
  `id_product` bigint UNSIGNED NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int NOT NULL DEFAULT 0,
  `gross_price` decimal(8, 2) NOT NULL,
  `final_price` decimal(8, 2) NOT NULL,
  `quantity` int NOT NULL,
  `url_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_product_subsidiary`) USING BTREE,
  INDEX `subsidiaries_products_id_subsidiary_foreign`(`id_subsidiary` ASC) USING BTREE,
  INDEX `subsidiaries_products_id_product_foreign`(`id_product` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `subsidiary_providers`  (
  `id_subsidiary_provider` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_subsidiary` bigint UNSIGNED NOT NULL,
  `id_provider` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_subsidiary_provider`) USING BTREE,
  INDEX `subsidiaries_providers_id_subsidiary_foreign`(`id_subsidiary` ASC) USING BTREE,
  INDEX `subsidiaries_providers_id_provider_foreign`(`id_provider` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `transaction_detail`  (
  `id_transaction_detail` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_transaction` bigint UNSIGNED NOT NULL,
  `id_subsidiary_product` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_transaction_detail`) USING BTREE,
  INDEX `transactions_details_id_transaction_foreign`(`id_transaction` ASC) USING BTREE,
  INDEX `transactions_details_id_subsidiary_product_foreign`(`id_subsidiary_product` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `transactions`  (
  `id_transaction` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_employee` bigint UNSIGNED NOT NULL,
  `id_status` bigint UNSIGNED NOT NULL,
  `discount` int NOT NULL,
  `subtotal` decimal(8, 2) NOT NULL,
  `final_price` decimal(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_transaction`) USING BTREE,
  INDEX `transactions_id_employee_foreign`(`id_employee` ASC) USING BTREE,
  INDEX `transactions_id_status_foreign`(`id_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

ALTER TABLE `companies` ADD CONSTRAINT `companies_id_company_detail_foreign` FOREIGN KEY (`id_company_detail`) REFERENCES `company_details` (`id_company_detail`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `companies` ADD CONSTRAINT `companies_id_status_foreign` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `employees` ADD CONSTRAINT `employees_id_employment_information_foreign` FOREIGN KEY (`id_employment_information`) REFERENCES `employment_informations` (`id_employment_information`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `employees` ADD CONSTRAINT `employees_id_job_foreign` FOREIGN KEY (`id_job`) REFERENCES `jobs` (`id_job`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `employees` ADD CONSTRAINT `employees_id_person_foreign` FOREIGN KEY (`id_person`) REFERENCES `persons` (`id_person`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `employees` ADD CONSTRAINT `employees_id_status_foreign` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `employees` ADD CONSTRAINT `employees_id_subsidiary_foreign` FOREIGN KEY (`id_subsidiary`) REFERENCES `subsidiaries` (`id_subsidiary`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_id_payment_foreign` FOREIGN KEY (`id_payment`) REFERENCES `payments` (`id_payment`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_id_status_foreign` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_id_transaction_foreign` FOREIGN KEY (`id_transaction`) REFERENCES `transactions` (`id_transaction`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `jobs` ADD CONSTRAINT `jobs_id_job_detail_foreign` FOREIGN KEY (`id_job_detail`) REFERENCES `job_details` (`id_job_detail`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `payments` ADD CONSTRAINT `payments_id_currency_foreign` FOREIGN KEY (`id_currency`) REFERENCES `currencies` (`id_currency`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `payments` ADD CONSTRAINT `payments_id_region_foreign` FOREIGN KEY (`id_region`) REFERENCES `regions` (`id_region`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `payments` ADD CONSTRAINT `payments_id_status_foreign` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `payments` ADD CONSTRAINT `payments_id_subsidiary_foreign` FOREIGN KEY (`id_subsidiary`) REFERENCES `subsidiaries` (`id_subsidiary`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `persons` ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`id_gender`) REFERENCES `genders` (`id_gender`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `products` ADD CONSTRAINT `products_id_corporations_foreign` FOREIGN KEY (`id_corporation`) REFERENCES `corporations` (`id_corporation`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `products` ADD CONSTRAINT `products_id_presentations_foreign` FOREIGN KEY (`id_presentation`) REFERENCES `presentations` (`id_presentation`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `products` ADD CONSTRAINT `products_id_product_detail_foreign` FOREIGN KEY (`id_product_detail`) REFERENCES `product_details` (`id_product_detail`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `products` ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_subcategory`) REFERENCES `subcategories` (`id_subcategory`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `purchase_schedullings` ADD CONSTRAINT `purchase_schedulling_id_subsidiary_provider_foreign` FOREIGN KEY (`id_subsidiary_provider`) REFERENCES `subsidiary_providers` (`id_subsidiary_provider`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `purchases` ADD CONSTRAINT `purchases_id_subsidiary_provider_foreign` FOREIGN KEY (`id_subsidiary_provider`) REFERENCES `subsidiary_providers` (`id_subsidiary_provider`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `purchases` ADD CONSTRAINT `purchases_id_transaction_foreign` FOREIGN KEY (`id_transaction`) REFERENCES `transactions` (`id_transaction`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sales` ADD CONSTRAINT `sales_id_transaction_foreign` FOREIGN KEY (`id_transaction`) REFERENCES `transactions` (`id_transaction`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `subcategories` ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `subsidiaries` ADD CONSTRAINT `subsidiaries_id_company_foreign` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id_company`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `subsidiary_products` ADD CONSTRAINT `subsidiaries_products_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `subsidiary_products` ADD CONSTRAINT `subsidiaries_products_id_subsidiary_foreign` FOREIGN KEY (`id_subsidiary`) REFERENCES `subsidiaries` (`id_subsidiary`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `subsidiary_providers` ADD CONSTRAINT `subsidiaries_providers_id_provider_foreign` FOREIGN KEY (`id_provider`) REFERENCES `providers` (`id_provider`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `subsidiary_providers` ADD CONSTRAINT `subsidiaries_providers_id_subsidiary_foreign` FOREIGN KEY (`id_subsidiary`) REFERENCES `subsidiaries` (`id_subsidiary`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `transaction_detail` ADD CONSTRAINT `transactions_details_id_subsidiary_product_foreign` FOREIGN KEY (`id_subsidiary_product`) REFERENCES `subsidiary_products` (`id_product_subsidiary`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `transaction_detail` ADD CONSTRAINT `transactions_details_id_transaction_foreign` FOREIGN KEY (`id_transaction`) REFERENCES `transactions` (`id_transaction`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `transactions` ADD CONSTRAINT `transactions_id_employee_foreign` FOREIGN KEY (`id_employee`) REFERENCES `employees` (`id_employee`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `transactions` ADD CONSTRAINT `transactions_id_status_foreign` FOREIGN KEY (`id_status`) REFERENCES `status` (`id_status`) ON DELETE RESTRICT ON UPDATE RESTRICT;

