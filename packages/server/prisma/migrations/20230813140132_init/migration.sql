-- CreateTable
CREATE TABLE "User" (
    "id" BIGINT NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BilibiliVideo" (
    "id" BIGINT NOT NULL,
    "extra" JSONB NOT NULL DEFAULT '{}',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BilibiliVideo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BilibiliBookmark" (
    "id" BIGINT NOT NULL,
    "userid" BIGINT NOT NULL,

    CONSTRAINT "BilibiliBookmark_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BilibiliBookmarkVideo" (
    "id" BIGINT NOT NULL,
    "bookmarkId" BIGINT NOT NULL,
    "VideoId" BIGINT NOT NULL,

    CONSTRAINT "BilibiliBookmarkVideo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BilibiliVideoLike" (
    "id" BIGINT NOT NULL,
    "bilibiliVideoId" BIGINT NOT NULL,
    "userId" BIGINT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BilibiliVideoLike_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE INDEX "User_createdAt_idx" ON "User"("createdAt");

-- CreateIndex
CREATE INDEX "User_updatedAt_idx" ON "User"("updatedAt");

-- CreateIndex
CREATE INDEX "BilibiliVideo_createdAt_idx" ON "BilibiliVideo"("createdAt");

-- CreateIndex
CREATE INDEX "BilibiliVideo_updatedAt_idx" ON "BilibiliVideo"("updatedAt");

-- CreateIndex
CREATE INDEX "BilibiliVideoLike_userId_idx" ON "BilibiliVideoLike"("userId");

-- CreateIndex
CREATE INDEX "BilibiliVideoLike_createdAt_idx" ON "BilibiliVideoLike"("createdAt");

-- CreateIndex
CREATE INDEX "BilibiliVideoLike_updatedAt_idx" ON "BilibiliVideoLike"("updatedAt");

-- CreateIndex
CREATE UNIQUE INDEX "BilibiliVideoLike_bilibiliVideoId_userId_key" ON "BilibiliVideoLike"("bilibiliVideoId", "userId");

-- AddForeignKey
ALTER TABLE "BilibiliBookmark" ADD CONSTRAINT "BilibiliBookmark_userid_fkey" FOREIGN KEY ("userid") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BilibiliBookmarkVideo" ADD CONSTRAINT "BilibiliBookmarkVideo_bookmarkId_fkey" FOREIGN KEY ("bookmarkId") REFERENCES "BilibiliBookmark"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BilibiliBookmarkVideo" ADD CONSTRAINT "BilibiliBookmarkVideo_VideoId_fkey" FOREIGN KEY ("VideoId") REFERENCES "BilibiliVideo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BilibiliVideoLike" ADD CONSTRAINT "BilibiliVideoLike_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BilibiliVideoLike" ADD CONSTRAINT "BilibiliVideoLike_bilibiliVideoId_fkey" FOREIGN KEY ("bilibiliVideoId") REFERENCES "BilibiliVideo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
