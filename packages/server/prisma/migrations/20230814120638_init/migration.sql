-- AlterTable
CREATE SEQUENCE bilibilibookmark_id_seq;
ALTER TABLE "BilibiliBookmark" ALTER COLUMN "id" SET DEFAULT nextval('bilibilibookmark_id_seq');
ALTER SEQUENCE bilibilibookmark_id_seq OWNED BY "BilibiliBookmark"."id";

-- AlterTable
CREATE SEQUENCE bilibilibookmarkvideo_id_seq;
ALTER TABLE "BilibiliBookmarkVideo" ALTER COLUMN "id" SET DEFAULT nextval('bilibilibookmarkvideo_id_seq');
ALTER SEQUENCE bilibilibookmarkvideo_id_seq OWNED BY "BilibiliBookmarkVideo"."id";

-- AlterTable
CREATE SEQUENCE bilibilivideolike_id_seq;
ALTER TABLE "BilibiliVideoLike" ALTER COLUMN "id" SET DEFAULT nextval('bilibilivideolike_id_seq');
ALTER SEQUENCE bilibilivideolike_id_seq OWNED BY "BilibiliVideoLike"."id";

-- AlterTable
CREATE SEQUENCE user_id_seq;
ALTER TABLE "User" ALTER COLUMN "id" SET DEFAULT nextval('user_id_seq');
ALTER SEQUENCE user_id_seq OWNED BY "User"."id";
