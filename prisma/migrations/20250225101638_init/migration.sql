-- CreateTable
CREATE TABLE `zzclub_user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uid` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `phone` VARCHAR(191) NULL,
    `username` VARCHAR(191) NOT NULL,
    `nickname` VARCHAR(191) NULL,
    `password` VARCHAR(191) NOT NULL,
    `avatar_url` VARCHAR(191) NULL,
    `role` VARCHAR(191) NOT NULL DEFAULT 'user',

    UNIQUE INDEX `zzclub_user_uid_key`(`uid`),
    UNIQUE INDEX `zzclub_user_username_key`(`username`),
    UNIQUE INDEX `zzclub_user_nickname_key`(`nickname`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `zzclub_oauth` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `provider` VARCHAR(191) NOT NULL,
    `providerId` VARCHAR(191) NOT NULL,
    `providerToken` VARCHAR(191) NULL,
    `providerRefreshToken` VARCHAR(191) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `zzclub_oauth_provider_providerId_key`(`provider`, `providerId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `blog_comments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uid` VARCHAR(191) NOT NULL,
    `content` VARCHAR(191) NOT NULL,
    `create_ts` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_ts` DATETIME(3) NOT NULL,
    `type` VARCHAR(191) NOT NULL DEFAULT 'article',
    `user_id` INTEGER NOT NULL,

    UNIQUE INDEX `blog_comments_uid_key`(`uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `blog_sub_comments` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uid` VARCHAR(191) NOT NULL,
    `content` VARCHAR(191) NOT NULL,
    `create_ts` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_ts` DATETIME(3) NOT NULL,
    `comment_id` INTEGER NOT NULL,
    `reply_sub_comment_id` INTEGER NULL,
    `user_id` INTEGER NOT NULL,
    `memo_id` INTEGER NULL,

    UNIQUE INDEX `blog_sub_comments_uid_key`(`uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `blog_likes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `create_ts` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_ts` DATETIME(3) NOT NULL,
    `target` VARCHAR(191) NOT NULL DEFAULT 'article',
    `sub_comment_id` INTEGER NULL,
    `comment_id` INTEGER NULL,
    `user_id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `imgx_preset` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uid` VARCHAR(191) NOT NULL,
    `preset` JSON NOT NULL,
    `create_ts` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_ts` DATETIME(3) NOT NULL,
    `user_id` INTEGER NOT NULL,

    UNIQUE INDEX `imgx_preset_uid_key`(`uid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `zzclub_oauth` ADD CONSTRAINT `zzclub_oauth_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `zzclub_user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `blog_comments` ADD CONSTRAINT `blog_comments_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `zzclub_user`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `blog_sub_comments` ADD CONSTRAINT `blog_sub_comments_comment_id_fkey` FOREIGN KEY (`comment_id`) REFERENCES `blog_comments`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `blog_sub_comments` ADD CONSTRAINT `blog_sub_comments_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `zzclub_user`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `blog_likes` ADD CONSTRAINT `blog_likes_sub_comment_id_fkey` FOREIGN KEY (`sub_comment_id`) REFERENCES `blog_sub_comments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `blog_likes` ADD CONSTRAINT `blog_likes_comment_id_fkey` FOREIGN KEY (`comment_id`) REFERENCES `blog_comments`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `blog_likes` ADD CONSTRAINT `blog_likes_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `zzclub_user`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
