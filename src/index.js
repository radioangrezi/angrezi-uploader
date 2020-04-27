import Uppy from '@uppy/core'
import Dashboard from '@uppy/dashboard'
import Tus from '@uppy/tus'
import German from '@uppy/locales/lib/de_DE';


require('@uppy/core/dist/style.css')
require('@uppy/dashboard/dist/style.css')

const uppy = Uppy({
  debug: true,
  locale: German,
  autoProceed: false,
  restrictions: {
    maxFileSize: 1024 * 1000 * 1000,
    maxNumberOfFiles: 3,
    minNumberOfFiles: 1,
    allowedFileTypes: ['audio/*']
  }
})
.use(Dashboard, {
  trigger: '.UppyModalOpenerBtn',
  inline: true,
  target: '.uppy-dashboard-container',
  replaceTargetContent: true,
  showProgressDetails: true,
  note: 'Audiofiles only',
  width: "calc(100vw - 20px)",
  height: "calc(100vh - 20px)",
  metaFields: [
    { id: 'name', name: 'Name', placeholder: 'file name' },
    { id: 'caption', name: 'Caption', placeholder: 'describe what the image is about' }
  ],
  browserBackButtonClose: true
})
.use(Tus, { endpoint: 'http://upload.radioangrezi.de/files/' })

uppy.on('complete', result => {
  console.log('successful files:', result.successful)
  console.log('failed files:', result.failed)
})