.class Landroid/view/ViewRootImpl$TakenSurfaceHolder;
.super Lcom/android/internal/view/BaseSurfaceHolder;
.source "ViewRootImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/view/ViewRootImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TakenSurfaceHolder"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/view/ViewRootImpl;


# direct methods
.method constructor <init>(Landroid/view/ViewRootImpl;)V
    .locals 0

    .prologue
    .line 6324
    iput-object p1, p0, Landroid/view/ViewRootImpl$TakenSurfaceHolder;->this$0:Landroid/view/ViewRootImpl;

    invoke-direct {p0}, Lcom/android/internal/view/BaseSurfaceHolder;-><init>()V

    return-void
.end method


# virtual methods
.method public isCreating()Z
    .locals 1

    .prologue
    .line 6353
    iget-object v0, p0, Landroid/view/ViewRootImpl$TakenSurfaceHolder;->this$0:Landroid/view/ViewRootImpl;

    iget-boolean v0, v0, Landroid/view/ViewRootImpl;->mIsCreating:Z

    return v0
.end method

.method public onAllowLockCanvas()Z
    .locals 1

    .prologue
    .line 6327
    iget-object v0, p0, Landroid/view/ViewRootImpl$TakenSurfaceHolder;->this$0:Landroid/view/ViewRootImpl;

    iget-boolean v0, v0, Landroid/view/ViewRootImpl;->mDrawingAllowed:Z

    return v0
.end method

.method public onRelayoutContainer()V
    .locals 0

    .prologue
    .line 6333
    return-void
.end method

.method public onUpdateSurface()V
    .locals 2

    .prologue
    .line 6348
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Shouldn\'t be here"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setFixedSize(II)V
    .locals 2
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 6358
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Currently only support sizing from layout"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setFormat(I)V
    .locals 1
    .param p1, "format"    # I

    .prologue
    .line 6337
    iget-object v0, p0, Landroid/view/ViewRootImpl$TakenSurfaceHolder;->this$0:Landroid/view/ViewRootImpl;

    iget-object v0, v0, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    check-cast v0, Lcom/android/internal/view/RootViewSurfaceTaker;

    invoke-interface {v0, p1}, Lcom/android/internal/view/RootViewSurfaceTaker;->setSurfaceFormat(I)V

    .line 6338
    return-void
.end method

.method public setKeepScreenOn(Z)V
    .locals 1
    .param p1, "screenOn"    # Z

    .prologue
    .line 6364
    iget-object v0, p0, Landroid/view/ViewRootImpl$TakenSurfaceHolder;->this$0:Landroid/view/ViewRootImpl;

    iget-object v0, v0, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    check-cast v0, Lcom/android/internal/view/RootViewSurfaceTaker;

    invoke-interface {v0, p1}, Lcom/android/internal/view/RootViewSurfaceTaker;->setSurfaceKeepScreenOn(Z)V

    .line 6365
    return-void
.end method

.method public setType(I)V
    .locals 1
    .param p1, "type"    # I

    .prologue
    .line 6342
    iget-object v0, p0, Landroid/view/ViewRootImpl$TakenSurfaceHolder;->this$0:Landroid/view/ViewRootImpl;

    iget-object v0, v0, Landroid/view/ViewRootImpl;->mView:Landroid/view/View;

    check-cast v0, Lcom/android/internal/view/RootViewSurfaceTaker;

    invoke-interface {v0, p1}, Lcom/android/internal/view/RootViewSurfaceTaker;->setSurfaceType(I)V

    .line 6343
    return-void
.end method
